package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import com.example.planto.helper.Constants
import kotlinx.android.synthetic.main.activity_log_in.*

class LogInActivity : AppCompatActivity() {

    // ---> Instances

    private val userUtil = UserUtil()

    // ---> Overrides

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_log_in)

        buttonLogIn.setOnClickListener {
            val email = editTextLoginEmail.text.toString()
            val password = editTextLoginPassword.text.toString()
            checkInfo(email, password)
        }

        buttonJoin.setOnClickListener {
            val intent = Intent(this, JoinActivity::class.java)
            startActivity(intent)
        }

    }

    // ---> Methods

    // Check Fields and Forms
    private fun checkInfo(email: String, password: String) {
        if (email == "" || password == "") {
            showToast("모든 정보를 입력해주세요")
        } else if (!userUtil.isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else {
            signInProcess(email, password)
        }
    }

    private fun signInProcess(email: String, password: String) {
        
    }

    // Save User Info
    private fun saveUserInfo(email: String, password: String, token: String) {
        // ToDo: Decode JWT
        userUtil.saveUserPref(userUtil.prefsAuth, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsAutoLogin, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsEmail, email)
        userUtil.saveUserPref(userUtil.prefsPassword, password)
        userUtil.saveUserPref(userUtil.prefsToken, token)
    }

    // Show Toast
    private fun showToast(message: String) {
        Toast.makeText(applicationContext, message, Toast.LENGTH_LONG).show()
    }
}