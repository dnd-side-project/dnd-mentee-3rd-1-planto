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

        // Test Save Info on Device
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
            // Check Empty EditText
            val toast = Toast.makeText(this@JoinActivity,
                "모든 정보를 입력해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else if (password != confirmPassword) {
            // Check Password
            val toast = Toast.makeText(this@JoinActivity,
                "비밀번호가 일치하지 않아요", Toast.LENGTH_LONG)
            toast.show()
        } else if (!isValidEmail(email)) {
            // Check Email Form
            val toast = Toast.makeText(this@JoinActivity,
                "이메일 형식을 확인해주세요", Toast.LENGTH_LONG)
            toast.show()
        } else if (isExistingEmail(email)) {
            // Check Existing Email
            val toast = Toast.makeText(this@JoinActivity,
                "존재하는 이메일입니다", Toast.LENGTH_LONG)
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
        // To Do: Request Join & Log the User In
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

    private fun isExistingEmail(email: String): Boolean {
        // Temporary Users
        val testUser = mapOf("email" to "test@test.test", "nickNmae" to "Test", "password" to "1")
        val adminUser = mapOf("email" to "planto@planto.com", "nickName" to "Plantö", "password" to "1")
        val allUsers = listOf(testUser, adminUser)

        // Existing User Flag
        var isExisting: Boolean = false

        // To Do: Find a User by Email on DB
        for (user in allUsers) {
            if (user["email"] == email) {
                isExisting = true
            }
        }

        return isExisting
    }

    // Save User Info on Device
    private fun saveUserInfo(email: String, nickName: String, password: String) {
        // To Do: Save Token Key
        MyApplication.prefs.setString("email", email)
        MyApplication.prefs.setString("nickName", nickName)
        MyApplication.prefs.setString("password", password)
    }

    // Test Save Info
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
