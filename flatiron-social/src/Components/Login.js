import React, {useState} from "react";
// import { Link } from 'react-router-dom';
import {useHistory} from 'react-router-dom'

function Login(props) {
    const {updateUser, setErrors} = props


    const [name, setName] = useState("")
    const [password, setPassword] = useState("")
    const [handle, setHandler] = useState("")
    const [action, setAction] = useState("login")
    const history = useHistory()


    function handleNameChange(e){
        setName(e.target.value)
    }
    function handlePasswordChange(e){
        setPassword(e.target.value)
    }
    function handleHandleChange(e){
        setHandler(e.target.value)
    }

    function handleCreate(e) {
        e.preventDefault()
        const newUser = {
            name: name,
            password: password,
            handle: handle
        }

        fetch("http://localhost:3000/createUser", {
            method:'POST',
            headers:{'Content-Type': 'application/json'},
            body:JSON.stringify(newUser)
        }).then(res => {
            if (res.ok) {
                setErrors("User Created")
                action="login"
            } else {
                res.json()
                .then(json => setErrors(json.errors))
            }
        })
    }

    function handleSubmit(e){
        if (action != "create") {
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
                    .then(user => {
                        updateUser(user)
                        history.push('/home')
                    })
                } else {
                    res.json()
                    .then(json => setErrors(json.errors))
                }
            })
        }
        else {
            handleCreate(e)
        }
    }

    function setActionLogin() {
        console.log("SETTING LOGIN")
        setAction("login")
    }

    function setActionCreate() {
        console.log("SETTING CREATE")
        setAction("create")
    }

    return <div>
        <h1 className="login-header">Welcome to Reactr</h1>

        <div class="tab">
            <button onClick={setActionLogin}>Login</button>
            <button onClick={setActionCreate}>Create</button>
        </div>

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
                type='password'
                name='name'
                value = {password}
                onChange = {handlePasswordChange}
            />
            {action=="create" ? 
                <><label>Handle:</label>
                <input 
                    hidden = {action!= "create"?"true":"false"}
                    type='text'
                    name='handle'
                    value = {handle}
                    onChange = {handleHandleChange}
                />
                <input type="submit" value="Create"/>
                </>
            :
            <input type="submit" value="Login"/>}
        </form>
        </div>
}


export default Login