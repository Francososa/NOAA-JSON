module Lib.Types where

import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics


data NOAAResult = NOAAResult
  { uid :: T.Text
  , mindate :: T.Text
  , maxdate :: T.Text
  , name :: T.Text
  , datacoverage :: Double
  , resultId :: T.Text
  } deriving Show

instance FromJSON NOAAResult where
  parseJSON (Object v) =
    NOAAResult <$> v .: "uid"
               <*> v .: "mindate"
               <*> v .: "maxdate"
               <*> v .: "name"
               <*> v .: "datacoverage"
               <*> v .: "id"



data Resultset = Resultset
  { offset :: Int
  , count :: Int
  , limit :: Int } deriving (Show,Generic)

instance FromJSON Resultset


data Metadata = Metadata
  { resultset :: Resultset } deriving (Show,Generic)

instance FromJSON Metadata


data NOAAResponse = NOAAResponse
  { metadata :: Metadata
  , results :: [NOAAResult]
  } deriving (Show,Generic)

instance FromJSON NOAAResponse
