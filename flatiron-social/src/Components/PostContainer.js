import React from 'react'
import { Button, Comment, Form, Header } from 'semantic-ui-react'

function PostContainer(props) {

    const {post, currentUser} = props
return (
    <div className='feed'>
            {/* <h4>{currentUser.handle} says:   </h4>
            <p className='feed-content'>{post.text}</p>
           */}
        <Comment.Group>
      

        <Comment>
        <Comment.Avatar src='/images/avatar/small/matt.jpg' />
        <Comment.Content>
            <Comment.Author as='a'>{currentUser.handle}</Comment.Author>
            <Comment.Metadata>
            <div>Today at 5:42PM</div>
            </Comment.Metadata>
            <Comment.Text>{post.text}</Comment.Text>
            <Comment.Actions>
            <button>Reply</button>
            <button>Delete</button>
            </Comment.Actions>
        </Comment.Content>
        </Comment>
        </Comment.Group>
        </div>
)
}

export default PostContainer