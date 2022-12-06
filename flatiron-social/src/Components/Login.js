import React, {useState} from "react";
import { Link } from 'react-router-dom';


function Login(props) {

    const {updateUser, setErrors} = props

    const [name, setName] = useState("")
    const [password, setPassword] = useState("")

    function handleNameChange(e){
        setName(e.target.value)
    }
    function handlePasswordChange(e){
        setPassword(e.target.value)
    }

    function handleSubmit(e){
        e.preventDefault()
        const user = {
            name: name,
        password: password
    }
        setName("")
        setPassword("")
    
            fetch("http://localhost:3000/login", {
                method:'POST',
                headers:{'Content-Type': 'application/json'},
                body:JSON.stringify(user)
            })
            // .catch(res => console.log(res))
            .then (res => {
                if(res.ok){
                    res.json()
                    .then(user => updateUser(user))
                } else {
                    res.json()
                    .then(json => setErrors(json.errors))
                }
            })
    }
    




    return <div>
        <h1 className="login-header">Welcome! Please Login</h1>

        <form  className="login-form" onSubmit={handleSubmit}>
        <label>Name:</label>
        <input 
        type='text'
        name='name'
        value = {name}
        onChange = {handleNameChange}
        />
        <label>Password:</label>
        <input 
        type='text'
        name='name'
        value = {password}
        onChange = {handlePasswordChange}
        />
        <input onSubmit={() => console.log("Test")} type="submit" value="Login"/>
    </form>
        </div>
}


export default Login