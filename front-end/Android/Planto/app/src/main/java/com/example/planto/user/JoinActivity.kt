package com.example.planto.user

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.planto.R
import com.example.planto.helper.Constants
import com.example.planto.helper.RetrofitClient
import com.example.planto.user.request.Join
import com.example.planto.user.request.JoinService
import kotlinx.android.synthetic.main.activity_join.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class JoinActivity : AppCompatActivity() {

    // ---> Instances

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
        } else {
            requestJoin(email, nickName, password)
        }
    }

    // Request Join
    private fun requestJoin(email: String, nickName: String, password: String) {
        // [Init Retrofit & Service]
        val retrofit = RetrofitClient.getInstance()
        val joinService: JoinService = retrofit.create(JoinService::class.java)
        // [Start Join Process]
        joinService.requestJoin(email, password, nickName).enqueue(object : Callback<Join> {
            override fun onFailure(call: Call<Join>, t: Throwable) {
                // [Failed to Join]
                val message = "네트워크 상태를 확인해주세요."
                showToast(message)
            }

            override fun onResponse(call: Call<Join>, response: Response<Join>) {
                // [Check Response Code]
                if (response.code() == 201) {
                    // [Succeeded to Join]
                    saveUserInfo(email)

                    val message = "가입 성공! 로그인해주세요!"
                    showToast(message)

                    finish()  // Back to the previous Activity
                } else {  // Bad Request
                    val message = "가입에 실패했어요! 다시 시도해주세요."
                    showToast(message)
                }
            }

        })
    }

    // Save User Info
    private fun saveUserInfo(email: String) {
        userUtil.saveUserPref(userUtil.prefsAuth, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsAutoLogin, Constants.TRUE_STR)
        userUtil.saveUserPref(userUtil.prefsEmail, email)
    }

    // Show Toast
    private fun showToast(message: String) {
        Toast.makeText(this@JoinActivity, message, Toast.LENGTH_LONG).show()
    }

}
