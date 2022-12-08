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
        // id: post.id,
        user_id: post.user.id,
        text: post.text
    }
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
        .then(updatedPostData => {setPosts([...posts, updatedPostData])})
    }


return (


    <form  className="create-post-form"  onSubmit={postChangeSubmit}>
        <input 
        type="text"
        value={postChange}
        onChange={handlePostChange} 
        >

        </input>
                <button>Submit</button>
    </form>
)
}

export default EditPost