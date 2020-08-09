package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_edit_profile.*

class EditProfileActivity : AppCompatActivity() {
    private val userUtil = UserUtil()
    private val allUsers = userUtil.allUsers
    private var currentEmail = userUtil.loadUserPref(userUtil.prefsEmail)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_edit_profile)

        buttonEditProfile.setOnClickListener {
            buttonEditProfileDidTap()
        }
    }

    override fun onResume() {
        super.onResume()

        loadAndShowUserInformation()
    }

    private fun loadAndShowUserInformation() {
        // To Do: Request User Info & Show it
        for (user in allUsers) {
            if (user[UserUtil().prefsEmail] == currentEmail) {
                editTextEmail.setText(user[UserUtil().prefsEmail])
                editTextNickName.setText(user[UserUtil().prefsNickName])
            }
        }
    }

    private fun buttonEditProfileDidTap() {
        val email = editTextEmail.text.toString()
        val nickName = editTextNickName.text.toString()
        val password = editTextPassword.text.toString()
        val newPassword = editTextNewPassword.text.toString()
        val verifyNewPassword = editTextVerifyNewPassword.text.toString()

        if (email == "" || nickName == "" || password == "") {
            showToast("입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (newPassword != verifyNewPassword) {
            showToast("변경하실 비밀번호가 일치하지 않아요")
        } else if (!UserUtil().isValidEmail(email)) {
            showToast("이메일 형식을 확인해주세요")
        } else if (!UserUtil().checkUser(currentEmail, password)) {
            showToast("기존 비밀번호를 확인해주세요")
        } else if (UserUtil().checkUser(currentEmail, newPassword)) {
            showToast("기존 비밀번호와 새 비밀번호가 같습니다")
        } else {
            requestEditProfile(email, nickName, newPassword)
        }
    }

    private fun requestEditProfile(email: String, nickName: String, newPassword: String) {
        val userUtil = UserUtil()

        val status = 200

        if (status == 200) {
            // [Check New Email & Save]
            if (email != "" && UserUtil().isExistingEmail(email)) {
                checkEmailChangedAndChange(email)
            }
            // [Check New Password and Save]
            if (newPassword != "") {
                userUtil.saveUserPref(userUtil.prefsPassword, newPassword)
            }
            // [Save NickName]
            userUtil.saveUserPref(userUtil.prefsNickName, nickName)
            // [Go to UserDetail Activity]
            val intent = Intent(this, UserDetailActivity::class.java)
            startActivity(intent)
        } else {
            showToast("관리자에게 문의해주세요")
        }

    }

    private fun checkEmailChangedAndChange(email: String) {
        val userUtil = UserUtil()
        val isExistingEmail = userUtil.isExistingEmail(email)

        if (email != currentEmail && !isExistingEmail) {
            userUtil.saveUserPref(userUtil.prefsEmail, email)
        } else if (email != currentEmail && isExistingEmail) {
            showToast("이미 존재하는 이메일입니다.")
        }
    }

    private fun showToast(text: String) {
        val toast = Toast.makeText(this@EditProfileActivity, text, Toast.LENGTH_LONG)
        toast.show()
    }

}