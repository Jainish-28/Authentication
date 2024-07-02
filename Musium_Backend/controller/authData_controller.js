const UserData=require("../model/auth_model");
const GoogleData=require("../model/google_auth_model");
const bcryptjs=require("bcryptjs");
const jwt=require("jsonwebtoken");
const  secret_jwt = "Jainish28";

//Convert Password Into Hash
const securePassword=async(password)=>{
    try {
        const passwordHash= await bcryptjs.hash(password,8);
        return passwordHash;
    } catch (error) {
        throw error;
    }
}

//Method For Creating JsonWebToken
    const create_token=(id)=>{
        try{
            const token = jwt.sign({_id:id},secret_jwt);
            return token;
        }catch(error){
            throw error;
        }
    }

//Post Method For Get Data From User
exports.PostAuthdataController = async (req, res) => {
    try {
        const secPassword=await securePassword(req.body.password);
      const { name, email, password } = req.body;
      if (!name ||!email ||!password) {
        return res.status(400).json({ message: "Name, email, and password are required" });
      }
      const data = new UserData({ 
        name:req.body.name,
        email:req.body.email,
        password:secPassword
      });
      console.log(data);
      await data.save();
      res.status(201).json(data);
    } catch (error) {
      console.log(error);
      res.status(400).json({ message: "Invalid request" });
    }
};

exports.PostGoogleDataController = async (req, res) => {
    try {
      const { name, email,imgUrl ,googleId} = req.body;
      if (!name ||!email  || !imgUrl ||!googleId) {
        return res.status(405).json({ message: "Name, email, and googleId are required" });
      }
      const googleData = new GoogleData(req.body);
      console.log(googleData);
      await googleData.save();
      res.status(201).json(googleData);
    } catch (error) {
      console.log(error);
      res.status(404).json({ message: "Invalid request" });
    }
};

//Generate Webtoken When User SignIn
exports.PostSignInController = async (req,res) => {
    try {
        const email=req.body.email;
        const password=req.body.password;

        const userEmail = await UserData.findOne({email:email});
        if(userEmail){
            const passwordMacth = bcryptjs.compare(password,userEmail.password);
            if(passwordMacth){
                const tokenData = await create_token(userEmail._id)
                const userResult={
                    email:userEmail.email,
                    name:userEmail.name,
                    token:tokenData
                }
                const response = {
                    success:true,
                    msg: "User Details",
                    data:userResult
                }
                res.status(201).json(response);
                console.log(response);
            }else{
                res.status(404).json({success:false,msg:"Plzz Enter Correct Password"})
            }
        }else{
            res.status(400).json({success:false,msg:"Plzz Register First Or Check Email Id"});
        }

    } catch (error) {
        res.status(400).json(error.message);
    }
}

//Get Method To Send Data To User
// exports.GetAuthdataController = async(req,res)=>{
//     try {
//         const getData = await UserData.find();
//         res.status(200).json(getData);
//     } catch (error) {
//         res.status(404).json(error.message);
//     }
// }
