import React, {useState} from 'react'

function EditPost(props) {

    const { post, isEditing, setIsEditing, setPosts, posts} = props
    const [postChange, setPostChange] = useState(post.text)

function handlePostChange(e){
    setPostChange(e.target.value)
}

function postChangeSubmit(e) {
    e.preventDefault()
    const updatedPost = {
        id: post.id,
        // user_id: post.user.id,
        text: postChange
    }
    console.log(updatedPost)
    addUpdatedPost(updatedPost)
}

    function addUpdatedPost(updatedPost) {
        setIsEditing(!isEditing)
        fetch(`http://localhost:3000/posts/${post.id}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(updatedPost)
        })
        .then(r => r.json())
        .then(updatedPostData => setPosts(posts.map(post => post.id == updatedPostData.id ? updatedPostData : post )))
        // if it exists, replace it
    }


return (

    <div className='edit-form-container'>
    <form   onSubmit={postChangeSubmit}>
        <input 
        type="text"
        value={postChange}
        onChange={handlePostChange} 
        >

        </input>
                <button className='submit-edit-button'>Submit</button>
    </form>
    </div>
)
}

export default EditPost