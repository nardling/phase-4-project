import React, {useState, useEffect} from "react";
import { Link } from 'react-router-dom';
import {useHistory} from 'react-router-dom'
import PostContainer from "./PostContainer";



const postUrl = 'http://localhost:3000/posts/'




function Home(props) {
    const {setCurrentUser, currentUser, setErrors} = props


    const history = useHistory()
    const [posts, setPosts] = useState([])

    // successful server side, nothing happening client side yet..
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
            .then(setPosts)
        },[])

console.log(currentUser)
const renderPosts = posts.map(post => <PostContainer key={post.id} post={post} currentUser={currentUser}/>)

    return <div>
        <h1 className="login-header">Welcome To Reactr</h1>
        {/* <Link onClick={handleLogout} to="/">Click here to go to home</Link> */}
        <button onClick={handleLogout} className="logout-button">Logout</button>
        {renderPosts}
        </div>
}

export default Home