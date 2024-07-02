const mongoose=require("mongoose");
const validator=require("validator");


const googleuser = new mongoose.Schema({

    name: {
        type: String,
        required: true
      },
      email: {
        type: String,
        required: true,
        unique: [true, "Email Is Already Present"],
        validate: {
          validator: function(value) {
            return validator.isEmail(value);
          },
          message: "Invalid Email"
        }
      },
      imgUrl:{
        type:String,
        required:true
      },
      googleId:{
        type:String,
      }
})

const GoogleUser = mongoose.model("GoogleUserData",googleuser);

module.exports= GoogleUser;