package com.example.planto.user.request

import com.example.planto.helper.Constants
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface SignInService {

    @FormUrlEncoded
    @POST(Constants.AUTH)
    fun requestSignIn(
        @Field(Constants.EMAIL_STR) email: String,
        @Field(Constants.PASSWORD_STR) password: String
    ): Call<SignIn>

}
