
import './App.css';
import { Switch, Route } from "react-router-dom";
import Login from './Components/Login';
import React, {useState, useEffect} from 'react';
import Home  from './Components/Home';
import Header from './Components/Header';

function App() {

  const [user, setUser] = useState(null)


// allows user to stay logged in after page refresh

  useEffect(() => {
    fetch("/me").then((response) => {
      if (response.ok) {
        response.json().then((user) => setUser(user));
      }
    });
  }, []);

// sets user state to user upon successful login
  function handleLogin(user) {
    setUser(user);
  }

// self explanatory
  function handleLogout() {
    setUser(null);
  }




  return (
    <div className="App">

    <Switch>
      {/* <Header user={user} handleLogout={handleLogout}/> */}
      <Route exact path ="/">
        <Home />
      </Route>

    </Switch>
    
    </div>
  );
}

export default App;
