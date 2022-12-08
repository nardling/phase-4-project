import React, {useState, useEffect} from "react";
import { Link } from 'react-router-dom';
import {useHistory} from 'react-router-dom'
import PostContainer from "./PostContainer";
import { Form, TextArea } from 'semantic-ui-react'


const postUrl = 'http://localhost:3000/latest/'
// const deleteUrl = 'http://localhost:3000/posts/'



function Home(props) {
    const {setCurrentUser, currentUser, setErrors} = props


    const history = useHistory()
    const [posts, setPosts] = useState([])
    const [newPostData, setNewPostData] = useState("")

function postDataChange(e){
    setNewPostData(e.target.value)
}

    // Logs out user, returns them to login page
    const handleLogout = () => {
        fetch('http://localhost:3000/logout', {
        method: 'DELETE'
        })
        .then (res => {
            if(res.ok){
                history.push('/')
            } else {
                res.json()
                .then(json => setErrors(json.errors))
            }
        })
        }

    // Fetches posts associated with logged-in user
    useEffect(() => {
        fetch(postUrl + `${currentUser.id}`)
        .then(res => res.json())
        .then(p => {
            setPosts(p)
            // console.log(p)
            setErrors([])
        })
    },[])


        function handlePostSubmit(e){
            e.preventDefault()
            const newPost = {
                user_id: currentUser.id,
                text: newPostData
            }
            // console.log(newPost)
            createNewPost(newPost)
            setNewPostData("")
        }

        function createNewPost(newPost){
        fetch('http://localhost:3000/createPost/', {
            method: "POST",
            headers: {
                "Content-type": 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(newPost),
        })
        .then(res => res.json())
        .then(postData => {setPosts([...posts, postData])})
    }


    // DELETE POSTS
    const deletePost = (post) => {
        // debugger
        const updatedPostList = posts.filter(originalPostList => originalPostList !== post)
        setPosts([...posts, updatedPostList, currentUser])
    }

    //   // DELETE POSTS
    //     const deleteClick = () => {
    //     fetch(`http://localhost:3000/posts/${post.id}`, {
    //         method: "DELETE"
    //     })
    //     deletePost(post.id)
    //     debugger
    // }



    const renderPosts = posts.map(post => <PostContainer 
        key={post.id} 
        post={post} 
        posts={posts} 
        setPosts={setPosts} 
        deletePost={deletePost} 
        currentUser = {currentUser}

        />)

  

    return <div>
        {/* CREATING POSTS */}
        <h1 className="login-header">Welcome To Reactr</h1>
        <form  className="create-post-form"  onSubmit={handlePostSubmit}>
        <label>What's on your mind?</label>
            <TextArea onChange={postDataChange} placeholder='Talk some shit' />
                    <button>Submit</button>
    </form>


        <button onClick={handleLogout} className="logout-button">Logout</button>
        {renderPosts}
        </div>
}

export default Home