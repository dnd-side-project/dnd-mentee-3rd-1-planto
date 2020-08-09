package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.MyApplication
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_user_detail.*

class UserDetailActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_detail)

        buttonLeaveService.setOnClickListener {
            val intent = Intent(this, LeaveServiceActivity::class.java)
            startActivity(intent)
        }

        buttonEditProfile.setOnClickListener {
            val intent = Intent(this, EditProfileActivity::class.java)
            startActivity(intent)
        }

    }

    override fun onResume() {
        super.onResume()

        loadUserInformation()
    }

    private fun loadUserInformation() {
        // To Do: Request & Show User Information
        val testUser = mapOf("email" to "test@test.test", "nickName" to "Test", "password" to "1")
        val adminUser = mapOf("email" to "planto@planto.com", "nickName" to "Plantö", "password" to "1")
        val allUsers = listOf(testUser, adminUser)

        val email = MyApplication.prefs.getString(UserUtil().prefsEmail, UserUtil().defValue)

        for (user in allUsers) {
            if (user[UserUtil().prefsEmail] == email) {
                tvUserEmail.text = user[UserUtil().prefsEmail]
                tvUserNickName.text = user[UserUtil().prefsNickName]
            }
        }
    }
}