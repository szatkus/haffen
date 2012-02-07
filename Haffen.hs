{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty


main = scotty 3000 $ do
	get "/" $ do
		file "static/index.html"
	get "/:filename" $ do
		filename <- param "filename"
		file $ "static/" ++ filename
	post "/:filename" $ do
		filename <- param "filename"
		file $ "static/" ++ filename
