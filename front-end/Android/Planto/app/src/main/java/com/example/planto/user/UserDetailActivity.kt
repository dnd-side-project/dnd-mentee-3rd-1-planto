package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.auth0.android.jwt.JWT
import com.example.planto.R
import com.example.planto.helper.Constants
import kotlinx.android.synthetic.main.activity_user_detail.*
import java.util.*

class UserDetailActivity : AppCompatActivity() {

    // ---> Instances

    val userUtil = UserUtil()

    // ---> Overrides

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_detail)

        setOnClicks()
        updateUI()
    }

    // ---> Methods

    // Set OnClickListeners
    private fun setOnClicks() {
        // Leave Service Btn
        buttonLeaveService.setOnClickListener {
            val intent = Intent(this, LeaveServiceActivity::class.java)
            startActivity(intent)
        }
        // Edit Profile Btn
        buttonEditProfile.setOnClickListener {
            val intent = Intent(this, EditProfileActivity::class.java)
            startActivity(intent)
        }
    }

    // Update UI
    private fun updateUI() {
        val token = UserUtil().loadUserPref(userUtil.prefsToken)
        if (token != "") {
            val email = JWT(token).getClaim(Constants.EMAIL_STR).asString()
            val nickName = JWT(token).getClaim(Constants.USERNAME_STR).asString()
            tvUserEmail.text = email ?: ""
            tvUserNickName.text = nickName ?: ""
        }
    }

}