package com.example.planto.user

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.MyApplication
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_join.*

class JoinActivity : AppCompatActivity() {
    // Variables
    private var isAuthenticated = false
    private var autoLoginFlag = false
    private val prefsAuth = "isAuthenticated"
    private val prefsAutoLogin = "autoLoginFlag"
    private val prefsEmail = "email"
    private val prefsNickName = "nickName"
    private val prefsPassword = "password"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_join)

        // Test Save Info on Device
        Email().testSave()

        // Join Button on Click Listener
        buttonJoin.setOnClickListener {
            // Edit Text Values
            val email = editTextJoinEmail.text.toString()
            val nickName = editTextJoinNickName.text.toString()
            val password = editTextJoinPassword.text.toString()
            val confirmPassword = editTextJoinConfirmPassword.text.toString()

            checkRequires(email, nickName, password, confirmPassword)
        }
    }

    private fun checkRequires(email: String, nickName: String, password: String, confirmPassword: String) {
        if (email == "" || nickName == "" || password == "" || confirmPassword == "") {
            // Check Empty EditText
            val toast = Toast.makeText(this@JoinActivity,
                "모든 정보를 입력해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else if (password != confirmPassword) {
            // Check Password
            val toast = Toast.makeText(this@JoinActivity,
                "비밀번호가 일치하지 않아요", Toast.LENGTH_LONG)
            toast.show()
        } else if (!Email().isValidEmail(email)) {
            // Check Email Form
            val toast = Toast.makeText(this@JoinActivity,
                "이메일 형식을 확인해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else if (Email().isExistingEmail(email)) {
            // Check Existing Email
            val toast = Toast.makeText(this@JoinActivity,
                "존재하는 이메일입니다", Toast.LENGTH_LONG)
            toast.show()
        } else {
            // Request Join & Login
            requestJoin(email, nickName, password)
        }
    }

    // Request Join
    private fun requestJoin(email: String, nickName: String, password: String) {
        // To Do: Request Join & Log the User In
        var responseCode = 200

        if (responseCode == 200) {
            // Save Authentication Info on the Device
            isAuthenticated = true
            autoLoginFlag = true
            saveUserInfo(email, nickName, password)

            // To Do: Request Log the Created User In
            val toast = Toast.makeText(this@JoinActivity,
                "To Do: Login", Toast.LENGTH_LONG)
            toast.show()
        } else {
            // Internal Error Toast
            val toast = Toast.makeText(this@JoinActivity,
                "서버에 문제가 있어요", Toast.LENGTH_LONG)
            toast.show()
        }
    }

    // Save User Info on Device
    private fun saveUserInfo(email: String, nickName: String, password: String) {
        // To Do: Save Token Key
        MyApplication.prefs.setString(prefsAuth, isAuthenticated.toString())
        MyApplication.prefs.setString(prefsAutoLogin, autoLoginFlag.toString())
        MyApplication.prefs.setString(prefsEmail, email)
        MyApplication.prefs.setString(prefsNickName, nickName)
        MyApplication.prefs.setString(prefsPassword, password)
    }
}
