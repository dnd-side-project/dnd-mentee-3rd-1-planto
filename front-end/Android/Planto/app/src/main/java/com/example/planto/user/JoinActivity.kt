package com.example.planto.user

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.MyApplication
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_join.*

class JoinActivity : AppCompatActivity() {
    private var isAuthenticated = false
    private var isAutoLogin = false
    private val user = User()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_join)

        user.testSave()

        buttonJoin.setOnClickListener {
            val email = editTextJoinEmail.text.toString()
            val nickName = editTextJoinNickName.text.toString()
            val password = editTextJoinPassword.text.toString()
            val confirmPassword = editTextJoinConfirmPassword.text.toString()
            checkRequires(email, nickName, password, confirmPassword)
        }
    }

    private fun checkRequires(email: String, nickName: String, password: String, confirmPassword: String) {
        if (email == "" || nickName == "" || password == "" || confirmPassword == "") {
            showToast("모든 정보를 입력해주세요")
        } else if (password != confirmPassword) {
            showToast("비밀번호가 일치하지 않아요")
        } else if (!User().isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else if (User().isExistingEmail(email)) {
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

    private fun saveUserInfo(email: String, nickName: String, password: String) {
        // To Do: Save Token Key
        MyApplication.prefs.setString(user.prefsAuth, isAuthenticated.toString())
        MyApplication.prefs.setString(user.prefsAutoLogin, isAutoLogin.toString())
        MyApplication.prefs.setString(user.prefsEmail, email)
        MyApplication.prefs.setString(user.prefsNickName, nickName)
        MyApplication.prefs.setString(user.prefsPassword, password)
    }

    private fun showToast(text: String) {
        val toast = Toast.makeText(this@JoinActivity, text, Toast.LENGTH_LONG)
        toast.show()
    }
}
