import React from "react";
import { Link } from 'react-router-dom';
function Home(props) {

    const {setCurrentUser} = props
    // successful server side, nothing happening client side yet..
    const handleLogout = () => {
        fetch('http://localhost:3000/logout', {
        method: 'DELETE'
        })
        
        }
    return <div>
        <h1>Welcome To Flatiron Social</h1>
        {/* <Link onClick={handleLogout} to="/">Click here to go to home</Link> */}
        <button onClick={handleLogout}>logout</button>
        </div>
}

export default Home