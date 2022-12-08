import React, {useState} from 'react'
import { Button, Comment, Form, Header } from 'semantic-ui-react'
import EditPost from './EditPost'

function PostContainer(props) {
    const {post, currentUser, posts, setPosts, deletePost, messageCallBack, getDetailsCallBack} = props
    const [isEditing, setIsEditing] = useState(false)

    const addFollowerUrl = "http://localhost:3000/followUser/"

    function handleEdit() {
        setIsEditing(!isEditing)
    }
    
    // DELETE POSTS
    const deleteClick = () => {
        fetch(`http://localhost:3000/posts/${post.id}`, {
            method: "DELETE"
        })
        // debugger
        deletePost(post.id)
    }

    function md(e){
        console.log(e)
        if (e.button == 2) {
            e.preventDefault()
            const followerRelation = {followerId: currentUser.id, userId: post.user.id}
            fetch(addFollowerUrl,
                {
                    method: "POST",
                    headers: {
                        "Content-type": 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(followerRelation),
                })
            .then(res => {if (res.status == 201) {
                messageCallBack("Now Following " + post.user.handle)
            }})
            return true
        }
    }

    function getPostDetails() {
        getDetailsCallBack(post.id)
    }

return (
    <div className='feed'>
            {/* <h4>{currentUser.handle} says:   </h4>
            <p className='feed-content'>{post.text}</p>
           */}
        {isEditing? (<EditPost post={post} isEditing = {isEditing} setIsEditing={setIsEditing} setPosts={setPosts} posts={posts}/> 
        
        ) : (    
        
        <Comment.Group>
        <Comment>
        {/* <Comment.Avatar src='/images/avatar/small/matt.jpg' /> */}
        <Comment.Content>
            <Comment.Author onContextMenu={(e)=>{e.preventDefault(); return false;}} onMouseDown={md} as='a'>{post.user.handle}</Comment.Author>
            <Comment.Metadata>
            <div>{post.created_at}</div>
            </Comment.Metadata>
            <Comment.Text>{post.text}</Comment.Text>
            <Comment.Actions>
            <button className='reply-button'>Reply</button>
            <button className='edit-button' onClick={handleEdit}> Edit </button>
            {(post.child_posts && post.child_posts.length > 0) ? <button className='show-comments-button' onClick={getPostDetails}>Show Comments</button> : <></>}
            <button className='delete-button' onClick={deleteClick}>Delete</button>
            </Comment.Actions>
        </Comment.Content>
        </Comment>
        </Comment.Group>
    )}
        </div>
)
}

export default PostContainer