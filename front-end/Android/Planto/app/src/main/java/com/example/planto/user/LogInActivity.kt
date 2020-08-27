package com.example.planto.user

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import com.example.planto.helper.Constants
import com.example.planto.helper.RetrofitClient
import com.example.planto.user.request.SignIn
import com.example.planto.user.request.SignInService
import kotlinx.android.synthetic.main.activity_log_in.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LogInActivity : AppCompatActivity() {

    // ---> Instances

    private val userUtil = UserUtil()

    // ---> Overrides

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_log_in)

        updateUI()
        setOnClicks()
    }

    // ---> Methods

    // Set OnClickListeners
    private fun setOnClicks() {
        // Log In Btn
        buttonLogIn.setOnClickListener {
            val email = editTextLoginEmail.text.toString()
            val password = editTextLoginPassword.text.toString()
            checkInfo(email, password)
        }

        // Join Btn
        buttonJoin.setOnClickListener {
            val intent = Intent(this, JoinActivity::class.java)
            startActivity(intent)
        }
    }

    // Update UI
    private fun updateUI() {
        if (userUtil.loadUserPref(userUtil.prefsAuth) == Constants.TRUE_STR) {
            val intent = Intent(applicationContext, UserDetailActivity::class.java)
            startActivity(intent)
            finish()
        }
    }

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
        // [Init Retrofit & Service]
        val retrofit = RetrofitClient.getInstance()
        val signInService: SignInService = retrofit.create(SignInService::class.java)
        // [Start SignIn Process]
        signInService.requestSignIn(email, password).enqueue(object : Callback<SignIn> {
            override fun onFailure(call: Call<SignIn>, t: Throwable) {
                // [Failed to Join]
                val message = "네트워크 상태를 확인해주세요."
                showToast(message)
            }

            override fun onResponse(call: Call<SignIn>, response: Response<SignIn>) {
                // [Check Response Code]
                if (response.code() == 200) {  // OK
                    // [Succeeded to Sign In]
                    val tokenLength = response.body().toString().length
                    val token = response.body().toString().substring(13, tokenLength - 1)

                    val message = "로그인 성공! 반가워요!"
                    showToast(message)

                    saveUserInfo(email, token)

                    val intent = Intent(applicationContext, UserDetailActivity::class.java)
                    startActivity(intent)
                    finish()
                } else {  // Bad Request
                    val message = "로그인에 실패했어요! 정보를 확인해주세요."
                    showToast(message)
                }
            }

        })
    }

    // Save User Info
    private fun saveUserInfo(email: String, token: String) {
        userUtil.saveUserPref(userUtil.prefsAuth, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsAutoLogin, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsEmail, email)
        userUtil.saveUserPref(userUtil.prefsToken, token)
    }

    // Show Toast
    private fun showToast(message: String) {
        Toast.makeText(applicationContext, message, Toast.LENGTH_LONG).show()
    }
}