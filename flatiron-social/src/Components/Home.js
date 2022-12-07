import React, {useState, useEffect} from "react";
import { Link } from 'react-router-dom';
import {useHistory} from 'react-router-dom'




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

console.log(posts)

    return <div>
        <h1>Welcome To Flatiron Social</h1>
        {/* <Link onClick={handleLogout} to="/">Click here to go to home</Link> */}
        <button onClick={handleLogout} className="logout-button">Logout</button>
        {/* <PostContainer /> */}
        </div>
}

export default Home