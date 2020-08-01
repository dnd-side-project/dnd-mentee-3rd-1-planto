package com.example.planto

import android.content.DialogInterface
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import kotlinx.android.synthetic.main.activity_join.*

class JoinActivity : AppCompatActivity() {
    // To Do
    // ---> Request Creating a user to DB

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_join)

        // Action Bar
        val actionBar = supportActionBar
        actionBar!!.title = "회원 가입"

        testSave()

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
            val toast = Toast.makeText(this@JoinActivity,
                "모든 정보를 입력해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else if (password != confirmPassword) {
            val toast = Toast.makeText(this@JoinActivity,
                "비밀번호가 일치하지 않아요", Toast.LENGTH_LONG)
            toast.show()
        } else if (!isValidEmail(email)) {
            val toast = Toast.makeText(this@JoinActivity,
                "이메일 형식을 확인해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else {
            // Request Join & Login
            requestJoin(email, nickName, password)
        }
    }

    // Email Form Validator
    private fun isValidEmail(email: String): Boolean {
        return android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
    }

    // Request Join
    private fun requestJoin(email: String, nickName: String, password: String) {
        var responseCode = 200

        if (responseCode == 200) {
            // Save Authentication Info on the Device
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

    // Save User Info on Local Device
    private fun saveUserInfo(email: String, nickName: String, password: String) {
        MyApplication.prefs.setString("email", email)
        MyApplication.prefs.setString("nickName", nickName)
        MyApplication.prefs.setString("password", password)
    }

    private fun testSave() {
        val email = MyApplication.prefs.getString("email", "")
        val nickName = MyApplication.prefs.getString("nickName", "")
        val password = MyApplication.prefs.getString("password", "")

        if (email != "" || nickName != "" || password != "") {
            val alertBuilder = AlertDialog.Builder(this)
            alertBuilder.setTitle("values")
            alertBuilder.setMessage("email: $email\nnickName: $nickName\npassword: $password")
            alertBuilder.setPositiveButton("알겠어!", DialogInterface.OnClickListener { _, _ ->
                return@OnClickListener
            })

            alertBuilder.show()
        }
    }
}
