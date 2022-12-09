import React, {useState, useEffect} from "react";
import { Link } from 'react-router-dom';
import {useHistory} from 'react-router-dom'
import PostContainer from "./PostContainer";
import { Form, TextArea } from 'semantic-ui-react'


const postUrl = 'http://localhost:3000/latest/'
// const deleteUrl = 'http://localhost:3000/posts/'
const userPostsUrl = 'http://localhost:3000/userPosts/'
const messageDetailsUrl = 'http://localhost:3000/postDetail'

function Home(props) {
    const {setCurrentUser, currentUser, setErrors} = props

    const history = useHistory()
    const [posts, setPosts] = useState([])
    const [newPostData, setNewPostData] = useState("")
    const [searchUserName, setSearchUserName] = useState("")
    const [statusMessage, setStatusMessage] = useState("")

    function postDataChange(e){
        setNewPostData(e.target.value)
    }

    function userNameChange(e){
        setSearchUserName(e.target.value)
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

    function searchForUserPosts(e) {
        e.preventDefault()
        console.log(e.target.value)
        fetch(userPostsUrl + searchUserName)
        .then(res => res.json())
        .then(p => {
            setPosts(p)
        })
    }

    function handlePostSubmit(e){
        e.preventDefault()
        const newPost = {
            user_id: currentUser.id,
            text: newPostData
        }
        // console.log(newPost)
        createNewPost(newPost)
        setNewPostData("")
        window.scrollTo(0, document.body.scrollHeight);
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
        .then(postData => {
            // debugger
            setPosts([...posts, postData])
        })
    }

    function setStatus(msg) {
        setStatusMessage(msg)
        setTimeout(()=>{setStatusMessage("")}, 2000)
    }

    function getMessageDetails(id) {
        fetch(messageDetailsUrl + "/" + id).then(res=>res.json())
        .then(p=>{
            // console.log(p)
            setPosts(p)
        })
    }

    // DELETE POSTS
    const deletePost = (postId) => {
        // debugger
        const updatedPostList = posts.filter(originalPostList => originalPostList.id !== postId)
        setPosts(updatedPostList)
    }

    const renderPosts = posts.map(post => 
    <div className="posts-container">
    <PostContainer 
        key={post.id} 
        post={post} 
        posts={posts} 
        setPosts={setPosts} 
        deletePost={deletePost} 
        currentUser = {currentUser}
        messageCallBack={setStatus}
        getDetailsCallBack={getMessageDetails}
        />
        </div>)

  

    return <div>
        {/* CREATING POSTS */}
        <h1 className="login-header">Welcome To Reactr,  {currentUser.name}</h1>
        <div className="input-field-container">
        <form  onSubmit={handlePostSubmit}>
            <label>What's on your mind?</label>
            <input type="text" onChange={postDataChange} placeholder="Enter your post here..." />
            <button className="submit-button" type="submit">Submit</button>
            {/* <TextArea onChange={postDataChange} placeholder="What's on your mind?" />
                    <button>Submit</button> */}
        </form>

        </div>
        <form className="search-bar" onSubmit={searchForUserPosts}>
            <label>Search For User Posts (by handle): </label>
            <input type="text" onChange={userNameChange}></input>
            <button className="search-button">Search</button>
        </form>
        <text>{statusMessage}</text>


        {/* Searching for user posts */}
        {/* <Link onClick={handleLogout} to="/">Click here to go to home</Link> */}
        <button onClick={handleLogout} className="button-30">Logout</button>

        {renderPosts}
        </div>
}

export default Home