const mongoose = require("mongoose");
const validator = require("validator");

const AuthDataSchema = new mongoose.Schema({
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
  password: {
    type: String,
    required: true,
    validate: {
      validator: function(value) {
        return validator.isStrongPassword(value);
      },
      message: "Make Strong Password"
    }
  }
});

const AuthData = mongoose.model("AuthData", AuthDataSchema);

module.exports = AuthData;