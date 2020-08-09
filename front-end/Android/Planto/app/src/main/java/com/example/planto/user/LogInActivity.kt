package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_log_in.*

class LogInActivity : AppCompatActivity() {
    private var isAutoLogin: Boolean = false
    private var isAuthenticated: Boolean = false
    private val userUtil = UserUtil()

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

        checkBoxAutoLogin.setOnClickListener {
            isAutoLogin = checkBoxAutoLogin.isChecked
        }
    }

    private fun checkInfo(email: String, password: String) {
        if (email == "" || password == "") {
            showToast("모든 정보를 입력해주세요")
        } else if (!userUtil.isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else if (!userUtil.checkUser(email, password)) {
            showToast("입력하신 정보가 올바른지 확인해주세요")
        } else {
            isAuthenticated = true
            saveUserInfo(email, password)
            val intent = Intent(this, UserDetailActivity::class.java)
            startActivity(intent)
        }
    }

    private fun saveUserInfo(email: String, password: String) {
        // To Do: Save Token Key
        userUtil.saveUserPref(userUtil.prefsAuth, isAuthenticated.toString())
        userUtil.saveUserPref(userUtil.prefsAutoLogin, isAutoLogin.toString())
        userUtil.saveUserPref(userUtil.prefsEmail, email)
        userUtil.saveUserPref(userUtil.prefsPassword, password)
    }

    private fun showToast(text: String) {
        val toast = Toast.makeText(this@LogInActivity, text, Toast.LENGTH_LONG)
        toast.show()
    }
}