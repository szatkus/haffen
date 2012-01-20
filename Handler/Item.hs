module Item.Root where

import Import

postItemR = do
    let widget = do
            setTitle $ toHtml "aaa"
            addHamlet [hamlet|Looks like you have Javascript off. Name: #{"aaa"}|]
    let json = jsonMap [("name", jsonScalar "aaa")]
    defaultLayoutJson widget json
