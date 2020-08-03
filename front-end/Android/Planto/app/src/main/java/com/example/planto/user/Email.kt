package com.example.planto.user

import android.util.Log
import com.example.planto.MyApplication

class Email {
    private val prefsAuth = "isAuthenticated"
    private val prefsAutoLogin = "autoLoginFlag"
    private val prefsEmail = "email"
    private val prefsNickName = "nickName"
    private val prefsPassword = "password"
    private val defValue = ""

    // Email Form Regex Check
    fun isValidEmail(email: String): Boolean {
        return android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
    }

    // Check Existing Email
    fun isExistingEmail(email: String): Boolean {
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

    // To Do: Remove This Method
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