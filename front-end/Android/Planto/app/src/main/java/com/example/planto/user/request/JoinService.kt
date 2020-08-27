package com.example.planto.user.request

import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface JoinService {

    @FormUrlEncoded
    @POST("/users")
    fun requestSignIn(
        @Field("email") email: String,
        @Field("password") password: String,
        @Field("username") userName: String
    ): Call<Join>

}
