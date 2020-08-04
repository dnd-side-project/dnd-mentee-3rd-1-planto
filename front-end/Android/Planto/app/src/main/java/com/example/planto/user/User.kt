package com.example.planto.user

import android.util.Log
import com.example.planto.MyApplication

class User {
    val prefsAuth = "isAuthenticated"
    val prefsAutoLogin = "isAutoLogin"
    val prefsEmail = "email"
    val prefsNickName = "nickName"
    val prefsPassword = "password"

    private val defValue = ""

    fun isValidEmail(email: String): Boolean {
        return android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
    }

    fun isExistingEmail(email: String): Boolean {
        val testUser = mapOf("email" to "test@test.test", "nickNmae" to "Test", "password" to "1")
        val adminUser = mapOf("email" to "planto@planto.com", "nickName" to "Plantö", "password" to "1")
        val allUsers = listOf(testUser, adminUser)

        var isExisting: Boolean = false

        for (user in allUsers) {
            if (user["email"] == email) {
                isExisting = true
            }
        }
        return isExisting
    }

    fun checkUser(email: String, password: String): Boolean {
        val testUser = mapOf("email" to "test@test.test", "nickNmae" to "Test", "password" to "1")
        val adminUser = mapOf("email" to "planto@planto.com", "nickName" to "Plantö", "password" to "1")
        val allUsers = listOf(testUser, adminUser)

        var isCorrect: Boolean = false

        // To Do: Find a User by Email on DB
        for (user in allUsers) {
            if (user["email"] == email && user["password"] == password) {
                isCorrect = true
            }
        }
        return isCorrect
    }

    fun testSave() {
        val authFlag = MyApplication.prefs.getString(prefsAuth, defValue)
        val autoLogin = MyApplication.prefs.getString(prefsAutoLogin, defValue)
        val email = MyApplication.prefs.getString(prefsEmail, defValue)
        val nickName = MyApplication.prefs.getString(prefsNickName, defValue)
        val password = MyApplication.prefs.getString(prefsPassword, defValue)

        if (authFlag != "" || autoLogin != "" || email != "" || nickName != "" || password != "") {
            Log.i("Test", "\nauthFlag: $authFlag\nautoLogin: $autoLogin\nemail: $email\nnickName: $nickName\npassword: $password")
        }
    }
}