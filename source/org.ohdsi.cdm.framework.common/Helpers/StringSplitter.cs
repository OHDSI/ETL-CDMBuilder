using System;

namespace org.ohdsi.cdm.framework.common.Helpers
{
    public class StringSplitter
    {
        /// <summary>
        /// Create a new StringSplitter object with the given buffer size
        /// </summary>
        /// <param name="bufferSize"></param>
        public StringSplitter(int bufferSize)
        {
            this._buffer = new string[bufferSize];
        }

        /// <summary>
        /// The string buffer container
        /// </summary>
        private string[] _buffer;

        /// <summary>
        /// Get the results of the last split call
        /// </summary>
        public string[] Results
        {
            get
            {
                return this._buffer;
            }
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int Split(string value, char separator)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                if (value[i] == separator)
                {
                    this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                    resultIndex++;
                    startIndex = i + 1;
                }
            }

            // Find the last part
            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
            resultIndex++;

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array.
        /// This method is safe and will
        /// automatically adjust the buffer if needed
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// <returns>The number of results found</returns>
        public int SafeSplit(string value, char separator)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                if (value[i] == separator)
                {
                    // Check if the array needs to be resized
                    if (this._buffer.Length == resultIndex)
                    {
                        Array.Resize(ref this._buffer, this._buffer.Length * 2);
                    }

                    this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                    resultIndex++;
                    startIndex = i + 1;
                }
            }

            // Check if the array needs to be resized
            if (this._buffer.Length == resultIndex)
            {
                Array.Resize(ref this._buffer, this._buffer.Length * 2);
            }

            // Find the last part
            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);

            return resultIndex + 1;
        }


        /// <summary>            
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// a specified string or Unicode character array.
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// <returns>The number of results found</returns>
        public int Split(string value, string separator)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Calculate the max index so we don't return false results during the index comparison
            // which is set to true at start, so if only one character is left and matches will remain true
            int maxIndex = value.Length - separator.Length;
            for (int i = 0; i < maxIndex; i++)
            {
                bool matchFound = true;
                for (int n = 0; n < separator.Length && (n + i) < value.Length; n++)
                {
                    if (value[i + n] != separator[n])
                    {
                        matchFound = false;
                        break;
                    }
                }

                if (matchFound)
                {
                    this._buffer[resultIndex] = value.Substring(startIndex, i + separator.Length - startIndex - separator.Length);
                    resultIndex++;
                    startIndex = i + separator.Length;
                    i += separator.Length - 1;
                }
            }


            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
            return resultIndex + 1;
        }

        /// <summary>
        /// Split the string
        /// </summary>
        /// <param name="value">The number of results found</param>
        /// <param name="separator"></param>
        /// <returns></returns>
        public int SafeSplit(string value, string separator)
        {
            int resultIndex = 0;
            int startIndex = 0;
            // Calculate the max index so we don't return false results during the index comparison
            // which is set to true at start, so if only one character is left and matches will remain true
            int maxIndex = value.Length - separator.Length;
            for (int i = 0; i < maxIndex; i++)
            {
                // Match the whole string
                bool matchFound = true;
                for (int n = 0; n < separator.Length && (n + i) < value.Length; n++)
                {
                    if (value[i + n] != separator[n])
                    {
                        matchFound = false;
                        break;
                    }
                }

                if (matchFound)
                {
                    // Check if the array needs to be resized
                    if (this._buffer.Length == resultIndex)
                    {
                        Array.Resize(ref this._buffer, this._buffer.Length * 2);
                    }

                    this._buffer[resultIndex] = value.Substring(startIndex, i + separator.Length - startIndex - separator.Length);
                    resultIndex++;
                    startIndex = i + separator.Length;
                    i += separator.Length - 1;
                }
            }

            // Check if the array needs to be resized
            if (this._buffer.Length == resultIndex)
            {
                Array.Resize(ref this._buffer, this._buffer.Length * 2);
            }

            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
            return resultIndex + 1;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separators"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int Split(string value, char[] separators)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                // Match the whole string
                bool matchFound = false;
                for (int n = 0; n < separators.Length; n++)
                {
                    if (value[i] == separators[n])
                    {
                        matchFound = true;
                        break;
                    }
                }

                if (matchFound)
                {
                    this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                    resultIndex++;
                    startIndex = i + 1;
                }
            }

            // Find the last part
            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
            resultIndex++;

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separators"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int SafeSplit(string value, char[] separators)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                // Match the whole string
                bool matchFound = false;
                for (int n = 0; n < separators.Length; n++)
                {
                    if (value[i] == separators[n])
                    {
                        matchFound = true;
                        break;
                    }
                }

                if (matchFound)
                {
                    // Check if the array needs to be resized
                    if (this._buffer.Length == resultIndex)
                    {
                        Array.Resize(ref this._buffer, this._buffer.Length * 2);
                    }

                    this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                    resultIndex++;
                    startIndex = i + 1;
                }
            }

            // Check if the array needs to be resized
            if (this._buffer.Length == resultIndex)
            {
                Array.Resize(ref this._buffer, this._buffer.Length * 2);
            }

            // Find the last part
            this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
            resultIndex++;

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// /// <param name="options"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int Split(string value, char separator, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                if (value[i] == separator)
                {
                    if (options == StringSplitOptions.None || i - startIndex > 0)
                    {
                        this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                        resultIndex++;
                    }

                    startIndex = i + 1;
                }
            }

            // Find the last part
            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array.
        /// This method is safe and will
        /// automatically adjust the buffer if needed
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// <param name="options"></param>
        /// <returns>The number of results found</returns>
        public int SafeSplit(string value, char separator, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                if (value[i] == separator)
                {
                    if (options == StringSplitOptions.None || i - startIndex > 0)
                    {
                        // Check if the array needs to be resized
                        if (this._buffer.Length == resultIndex)
                        {
                            Array.Resize(ref this._buffer, this._buffer.Length * 2);
                        }
                        this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                        resultIndex++;
                    }

                    startIndex = i + 1;
                }
            }

            // Find the last part
            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                // Check if the array needs to be resized
                if (this._buffer.Length == resultIndex)
                {
                    Array.Resize(ref this._buffer, this._buffer.Length * 2);
                }

                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }


            return resultIndex;
        }


        /// <summary>            
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// a specified string or Unicode character array.
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separator"></param>
        /// <param name="options"></param>
        /// <returns>The number of results found</returns>
        public int Split(string value, string separator, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Calculate the max index so we don't return false results during the index comparison
            // which is set to true at start, so if only one character is left and matches will remain true
            int maxIndex = value.Length - separator.Length;
            for (int i = 0; i < maxIndex; i++)
            {
                bool matchFound = true;
                for (int n = 0; n < separator.Length && (n + i) < value.Length; n++)
                {
                    if (value[i + n] != separator[n])
                    {
                        matchFound = false;
                        break;
                    }
                }

                if (matchFound)
                {
                    if (options == StringSplitOptions.None || i + separator.Length - startIndex - separator.Length > 0)
                    {
                        this._buffer[resultIndex] = value.Substring(startIndex, i + separator.Length - startIndex - separator.Length);
                        resultIndex++;
                    }

                    startIndex = i + separator.Length;
                    i += separator.Length - 1;
                }
            }

            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                // Find the last part
                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }

            return resultIndex;
        }

        /// <summary>
        /// Split the string
        /// </summary>
        /// <param name="value">The number of results found</param>
        /// <param name="separator"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        public int SafeSplit(string value, string separator, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;
            // Calculate the max index so we don't return false results during the index comparison
            // which is set to true at start, so if only one character is left and matches will remain true
            int maxIndex = value.Length - separator.Length;
            for (int i = 0; i < maxIndex; i++)
            {
                // Match the whole string
                bool matchFound = true;
                for (int n = 0; n < separator.Length && (n + i) < value.Length; n++)
                {
                    if (value[i + n] != separator[n])
                    {
                        matchFound = false;
                        break;
                    }
                }

                if (matchFound)
                {
                    if (options == StringSplitOptions.None || i + separator.Length - startIndex - separator.Length > 0)
                    {
                        // Check if the array needs to be resized
                        if (this._buffer.Length == resultIndex)
                        {
                            Array.Resize(ref this._buffer, this._buffer.Length * 2);
                        }
                        this._buffer[resultIndex] = value.Substring(startIndex, i + separator.Length - startIndex - separator.Length);
                        resultIndex++;
                    }

                    startIndex = i + separator.Length;
                    i += separator.Length - 1;
                }
            }

            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                // Check if the array needs to be resized
                if (this._buffer.Length == resultIndex)
                {
                    Array.Resize(ref this._buffer, this._buffer.Length * 2);
                }

                // Find the last part
                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separators"></param>
        /// <param name="options"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int Split(string value, char[] separators, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                // Match the whole string
                bool matchFound = false;
                for (int n = 0; n < separators.Length; n++)
                {
                    if (value[i] == separators[n])
                    {
                        matchFound = true;
                        break;
                    }
                }

                if (matchFound)
                {
                    if (options == StringSplitOptions.None || i - startIndex > 0)
                    {
                        this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                        resultIndex++;
                    }

                    startIndex = i + 1;
                }
            }

            // Find the last part
            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                // Find the last part
                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }

            return resultIndex;
        }

        /// <summary>
        /// Returns a string array that contains the substrings in this instance that are delimited by 
        /// elements of a specified string or Unicode character array. This method is unsafe and can throw 
        /// IndexOutOfRange exception if we overflow the buffer
        /// </summary>
        /// <param name="value"></param>
        /// <param name="separators"></param>
        /// <param name="options"></param>
        /// <exception cref="IndexOutOfRange">IndexOutOfRange</exception>
        /// <returns>The number of results found</returns>
        public int SafeSplit(string value, char[] separators, StringSplitOptions options)
        {
            int resultIndex = 0;
            int startIndex = 0;

            // Find the mid-parts
            for (int i = 0; i < value.Length; i++)
            {
                // Match the whole string
                bool matchFound = false;
                for (int n = 0; n < separators.Length; n++)
                {
                    if (value[i] == separators[n])
                    {
                        matchFound = true;
                        break;
                    }
                }

                if (matchFound)
                {
                    if (options == StringSplitOptions.None || i - startIndex > 0)
                    {
                        // Check if the array needs to be resized
                        if (this._buffer.Length == resultIndex)
                        {
                            Array.Resize(ref this._buffer, this._buffer.Length * 2);
                        }

                        this._buffer[resultIndex] = value.Substring(startIndex, i - startIndex);
                        resultIndex++;
                    }

                    startIndex = i + 1;
                }
            }

            // Find the last part
            if (options == StringSplitOptions.None || value.Length - startIndex > 0)
            {
                // Check if the array needs to be resized
                if (this._buffer.Length == resultIndex)
                {
                    Array.Resize(ref this._buffer, this._buffer.Length * 2);
                }

                // Find the last part
                this._buffer[resultIndex] = value.Substring(startIndex, value.Length - startIndex);
                resultIndex++;
            }

            return resultIndex;
        }
    }
}
