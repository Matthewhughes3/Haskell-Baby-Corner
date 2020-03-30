import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

wordBytes = [99, 97, 110]

word = B.pack wordBytes
unWord = B.unpack word
