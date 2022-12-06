
import './App.css';
import { Switch, Route } from "react-router-dom";
import Login from './Components/Login';
import React, {useState, useEffect} from 'react';
import Home  from './Components/Home';
import Header from './Components/Header';

function App() {

  const [errors, setErrors] = useState([])
  const [currentUser, setCurrentUser] = useState(null)


const updateUser = (user) => setCurrentUser(user)


console.log(currentUser)
console.log(errors)



  return (
    <div className="App">

    <Switch>
      {/* <Header user={user} handleLogout={handleLogout}/> */}
      <Route exact path ="/">
        <Login updateUser = {updateUser} setErrors={setErrors} currentUser={currentUser}/>
      </Route>
    </Switch>

    {currentUser ? <h2>You're logged in!</h2> : <h2>Please LogIn</h2>}
    {errors.length > 0 ? <p>{errors}</p> : null }
    
    </div>
  );
}

export default App;
