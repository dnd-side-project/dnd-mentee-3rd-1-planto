package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.MyApplication
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_log_in.*

class LogInActivity : AppCompatActivity() {
    private var autoLoginFlag: Boolean = false
    private var isAuthenticated: Boolean = false
    private val prefsAuth = "isAuthenticated"
    private val prefsAutoLogin = "autoLoginFlag"
    private val prefsEmail = "email"
    private val prefsPassword = "password"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_log_in)

        // Test Save
        Email().testSave()

        // Login Button Click
        buttonLogIn.setOnClickListener {
            val email = editTextLoginEmail.text.toString()
            val password = editTextLoginPassword.text.toString()
            checkInfo(email, password)
        }

        // Join Button Click
        buttonJoin.setOnClickListener {
            val intent = Intent(this, JoinActivity::class.java)
            startActivity(intent)
        }

        // Auto Login Check Box
        checkBoxAutoLogin.setOnClickListener {
            autoLoginFlag = checkBoxAutoLogin.isChecked
        }
    }

    private fun checkInfo(email: String, password: String) {
        if (email == "" || password == "") {
            showToast("모든 정보를 입력해주세요")
        } else if (!Email().isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else if (!Email().checkUser(email, password)) {
            showToast("입력하신 정보가 올바른지 확인해주세요")
        } else {
            isAuthenticated = true
            saveUserInfo(email, password)
            Email().testSave()
        }
    }

    private fun saveUserInfo(email: String, password: String) {
        // To Do: Save Token Key
        MyApplication.prefs.setString(prefsAuth, isAuthenticated.toString())
        MyApplication.prefs.setString(prefsAutoLogin, autoLoginFlag.toString())
        MyApplication.prefs.setString(prefsEmail, email)
        MyApplication.prefs.setString(prefsPassword, password)
    }

    private fun showToast(text: String) {
        val toast = Toast.makeText(this@LogInActivity, text, Toast.LENGTH_LONG)
        toast.show()
    }
}