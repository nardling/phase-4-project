
import './App.css';
import { Switch, Route, Link } from "react-router-dom";
import Login from './Components/Login';
import React, {useState, useEffect} from 'react';
import Home  from './Components/Home';
import Header from './Components/Header';

function App() {

  const [errors, setErrors] = useState([])
  const [currentUser, setCurrentUser] = useState(null)




const updateUser = (user) => setCurrentUser(user)


// console.log(currentUser.id)
// console.log(errors)



  return (
    <div className="App">
      <Switch>
        <Route path='/home'>
          <Home setCurrentUser={setCurrentUser} currentUser={currentUser} setErrors={setErrors}/>
        </Route>
    
      <Route exact path ="/">
        <Login updateUser = {updateUser} setErrors={setErrors} currentUser={currentUser}/>
      </Route>
    </Switch>

    {currentUser ? <div>
      
    </div>
    : 
    <div>
    

    </div>
    } 

    {errors.length > 0 ? <p>{errors}</p> : null }
    
    </div>
  );
}

export default App;
