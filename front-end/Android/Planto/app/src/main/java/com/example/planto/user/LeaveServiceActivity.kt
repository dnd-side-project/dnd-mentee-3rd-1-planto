package com.example.planto.user

import android.content.DialogInterface
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import com.example.planto.FirstIntroActivity
import com.example.planto.MyApplication.Companion.prefs
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_leave_service.*

class LeaveServiceActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_leave_service)

        buttonLeaveService.setOnClickListener {
            showConfirmAlert()
        }
    }

    private fun showConfirmAlert () {
        val alertBuilder = AlertDialog.Builder(this)
        alertBuilder.setTitle("정말 탈퇴하시겠어요?")
        alertBuilder.setMessage("회원님의 정보는 탈퇴 즉시 삭제되니 주의해주세요!")
        alertBuilder.setPositiveButton("응") { _, _ ->
            val email = prefs.getString(UserUtil().prefsEmail, UserUtil().defValue).toString()
            val password = editTextTextPassword.text.toString()

            checkUserInfo(email, password)
        }
        alertBuilder.setNegativeButton("아니", DialogInterface.OnClickListener { _, _ ->
            return@OnClickListener
        })
        alertBuilder.show()
    }

    private fun checkUserInfo(email: String, password: String) {
        val users = UserUtil().allUsers

        // To Do: Check whether User Information is correct
        for (user in users) {
            if (email == user[UserUtil().prefsEmail] && password == user[UserUtil().prefsPassword]) {  // if it is
                Toast.makeText(this, "Success", Toast.LENGTH_LONG).show()
                // To Do: Request Delete User
                resetUserPrefs()
                val intent = Intent(this, FirstIntroActivity::class.java)
                startActivity(intent)
            }
        }
    }

    private fun resetUserPrefs() {
        prefs.setString(UserUtil().prefsAuth, "false")
        prefs.setString(UserUtil().prefsAutoLogin, "false")
        prefs.setString(UserUtil().prefsEmail, UserUtil().defValue)
        prefs.setString(UserUtil().prefsNickName, UserUtil().defValue)
        prefs.setString(UserUtil().prefsPassword, UserUtil().defValue)
    }

}