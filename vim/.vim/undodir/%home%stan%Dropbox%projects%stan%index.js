Vim�UnDo� ��C�k{�;�Sz�)���P�x�#�!��7��                     %       %   %   %    Z���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Z��    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Z���     �                 #const express = require('express');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Z���     �          !      const path = require('path');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �          !          7const generatePassword = require('password-generator');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 7const generatePassword = require('password-generator');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 const app = express();5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 (// Serve static files from the React app5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 >app.use(express.static(path.join(__dirname, 'client/build')));5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 %// Put all API endpoints under '/api'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 )app.get('/api/passwords', (req, res) => {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                   const count = 5;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                   // Generate some passwords5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 <  const passwords = Array.from(Array(count).keys()).map(i =>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                     generatePassword(12, false)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                   )5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                   // Return them as json5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                   res.json(passwords);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 )  console.log(`Sent ${count} passwords`);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 });5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 7// The "catchall" handler: for any request that doesn't5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 6// match one above, send back React's index.html file.5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 app.get('*', (req, res) => {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 @  res.sendFile(path.join(__dirname+'/client/build/index.html'));5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 });5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�       "           !           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 &const port = process.env.PORT || 5000;5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 app.listen(port);5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                  5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���     �                 7console.log(`Password generator listening on ${port}`);5�_�   $               %           ����                                                                                                                                                                                                                                                                                                                                                  v        Z���    �                   5��