package com.example.planto.user

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_join.*

class JoinActivity : AppCompatActivity() {

    // ---> Instances

    private var isAuthenticated = false
    private var isAutoLogin = false
    private val userUtil = UserUtil()

    // ---> Overrides

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_join)

        setOnClicks()
    }

    // ---> Methods

    // Init OnClickListeners
    private fun setOnClicks() {
        buttonJoin.setOnClickListener {
            val email = editTextJoinEmail.text.toString()
            val nickName = editTextJoinNickName.text.toString()
            val password = editTextJoinPassword.text.toString()
            val confirmPassword = editTextJoinConfirmPassword.text.toString()
            checkRequires(email, nickName, password, confirmPassword)
        }
    }

    // Check Empty Fields and Forms
    private fun checkRequires(
        email: String,
        nickName: String,
        password: String,
        confirmPassword: String
    ) {
        if (email == "" || nickName == "" || password == "" || confirmPassword == "") {
            showToast("모든 정보를 입력해주세요")
        } else if (password != confirmPassword) {
            showToast("비밀번호가 일치하지 않아요")
        } else if (!userUtil.isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else if (userUtil.isExistingEmail(email)) {
            showToast("존재하는 이메일입니다")
        } else {
            requestJoin(email, nickName, password)
        }
    }

    // Request Join
    private fun requestJoin(email: String, nickName: String, password: String) {
        var responseCode = 200

        if (responseCode == 200) {
            isAuthenticated = true
            isAutoLogin = true
            saveUserInfo(email, nickName, password)
            // To Do: Request Log the Created User In
            showToast("To Do: Login")
        } else {
            showToast("입력하신 정보를 확인해주세요")
        }
    }

    // Save User Info
    private fun saveUserInfo(email: String, nickName: String, password: String) {
        // To Do: Save Token Key
        userUtil.saveUserPref(userUtil.prefsAuth, isAuthenticated.toString())
        userUtil.saveUserPref(userUtil.prefsAutoLogin, isAutoLogin.toString())
        userUtil.saveUserPref(userUtil.prefsEmail, email)
        userUtil.saveUserPref(userUtil.prefsNickName, nickName)
        userUtil.saveUserPref(userUtil.prefsPassword, password)
    }

    // Show Toast
    private fun showToast(message: String) {
        Toast.makeText(this@JoinActivity, message, Toast.LENGTH_LONG).show()
    }
}
