class UserPostController < ApplicationController
    def users_index
        @userData = RestClient.get("https://jsonplaceholder.typicode.com/users")
        render json: @userData
    end

    def posts_index
        @postsData = RestClient.get("https://jsonplaceholder.typicode.com/posts")
        render json: @postsData
    end

    def user_post_index
        @userData = RestClient.get("https://jsonplaceholder.typicode.com/users")
        @postsData = RestClient.get("https://jsonplaceholder.typicode.com/posts")

        @UserPosts  = JSON.parse(@postsData).map do |post|
            user = JSON.parse(@userData).select{|u| u["id"]==post["userId"]}.first
            {name: user["name"], email: user["email"], id: user["id"], title: post["title"], body: post["body"]}
                end

                render json: @UserPosts

        # render json: {
        #     results: JSON.parse(@postsData).map do |post|
        # user = JSON.parse(@userData).select{|u| u["id"]==post["userId"]}.first
        # {name: user["name"], email: user["email"], id: user["id"], title: post["title"], body: post["body"]}
        #     end
        # }
    end
end
