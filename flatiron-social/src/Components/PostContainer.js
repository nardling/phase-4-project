import React from 'react'
import { Button, Comment, Form, Header } from 'semantic-ui-react'

function PostContainer(props) {
    const {post, currentUser, posts, setPosts, deletePost} = props

//   // DELETE POSTS
    const deleteClick = () => {
    fetch(`http://localhost:3000/posts/${post.id}`, {
        method: "DELETE"
    })
    // debugger
    deletePost(post.id)
}

// const deletePost = (postID) => {
//     // debugger
//     const updatedPostList = posts.filter(originalPostList => originalPostList.id !== postID)
//     setPosts([...posts, updatedPostList])
// }


function getCurrentPost(e){
    console.log(post.user.handle)
}



return (
    <div className='feed'>
            {/* <h4>{currentUser.handle} says:   </h4>
            <p className='feed-content'>{post.text}</p>
           */}
        <Comment.Group>
      

        <Comment>
        {/* <Comment.Avatar src='/images/avatar/small/matt.jpg' /> */}
        <Comment.Content>
            <Comment.Author as='a'>{post.user.handle}</Comment.Author>
            <Comment.Metadata>
            <div>Today at 5:42PM</div>
            </Comment.Metadata>
            <Comment.Text>{post.text}</Comment.Text>
            <Comment.Actions>
            <button onClick={getCurrentPost}>Reply</button>
            <button onClick={deleteClick}>Delete</button>
            {post.child_posts.length > 0 ? <button>Show Comments</button> : <></>}
            </Comment.Actions>
        </Comment.Content>
        </Comment>
        </Comment.Group>
        </div>
)
}

export default PostContainer