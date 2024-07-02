const {PostAuthdataController, GetAuthdataController,PostSignInController, PostGoogleDataController} = require("../controller/authData_controller");
const express = require("express");
const router=new express.Router();

router.post('/userData/postData',PostAuthdataController);
router.post('/userData/signIn',PostSignInController);
router.post('/userData/googleUserData',PostGoogleDataController);
// router.get('/userData/getData',GetAuthdataController);

module.exports=router;