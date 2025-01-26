-- 3368. First Letter Capitalization

-- Hard

-- Table: user_content
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | content_id  | int     |
-- | content_text| varchar |
-- +-------------+---------+
-- content_id is the unique key for this table.
-- Each row contains a unique ID and the corresponding text content.
-- Write a solution to transform the text in the content_text column by applying the following rules:
--
-- Convert the first letter of each word to uppercase
-- Keep all other letters in lowercase
-- Preserve all existing spaces
-- Note: There will be no special character in content_text.
--
-- Return the result table that includes both the original content_text and the modified text where each word starts with a capital letter.
--
-- The result format is in the following example.
--
--
--
-- Example:
--
-- Input:
--
-- user_content table:
--
-- +------------+-----------------------------------+
-- | content_id | content_text                      |
-- +------------+-----------------------------------+
-- | 1          | hello world of SQL                |
-- | 2          | the QUICK brown fox               |
-- | 3          | data science AND machine learning |
-- | 4          | TOP rated programming BOOKS       |
-- +------------+-----------------------------------+
-- Output:
--
-- +------------+-----------------------------------+-----------------------------------+
-- | content_id | original_text                     | converted_text                    |
-- +------------+-----------------------------------+-----------------------------------+
-- | 1          | hello world of SQL                | Hello World Of Sql                |
-- | 2          | the QUICK brown fox               | The Quick Brown Fox               |
-- | 3          | data science AND machine learning | Data Science And Machine Learning |
-- | 4          | TOP rated programming BOOKS       | Top Rated Programming Books       |
-- +------------+-----------------------------------+-----------------------------------+
-- Explanation:
--
-- For content_id = 1:
-- Each word's first letter is capitalized: Hello World Of Sql
-- For content_id = 2:
-- Original mixed-case text is transformed to title case: The Quick Brown Fox
-- For content_id = 3:
-- The word AND is converted to "And": "Data Science And Machine Learning"
-- For content_id = 4:
-- Handles word TOP rated correctly: Top Rated
-- Converts BOOKS from all caps to title case: Books

SELECT content_id,
       content_text        AS original_text,
       REPLACE(
               REPLACE(
                       REPLACE(
                               REPLACE(
                                       REPLACE(
                                               REPLACE(
                                                       REPLACE(
                                                               REPLACE(
                                                                       REPLACE(
                                                                               REPLACE(
                                                                                       REPLACE(
                                                                                               REPLACE(
                                                                                                       REPLACE(
                                                                                                               REPLACE(
                                                                                                                       REPLACE(
                                                                                                                               REPLACE(
                                                                                                                                       REPLACE(
                                                                                                                                               REPLACE(
                                                                                                                                                       REPLACE(
                                                                                                                                                               REPLACE(
                                                                                                                                                                       REPLACE(
                                                                                                                                                                               REPLACE(
                                                                                                                                                                                       REPLACE(
                                                                                                                                                                                               REPLACE(
                                                                                                                                                                                                       REPLACE(
                                                                                                                                                                                                               REPLACE(
                                                                                                                                                                                                                       CONCAT(
                                                                                                                                                                                                                               UPPER(SUBSTRING(content_text, 1, 1)),
                                                                                                                                                                                                                               LOWER(SUBSTRING(content_text, 2))),
                                                                                                                                                                                                                       " z",
                                                                                                                                                                                                                       " Z"),
                                                                                                                                                                                                               " y",
                                                                                                                                                                                                               " Y"),
                                                                                                                                                                                                       " x",
                                                                                                                                                                                                       " X"),
                                                                                                                                                                                               " w",
                                                                                                                                                                                               " W"),
                                                                                                                                                                                       " v",
                                                                                                                                                                                       " V"),
                                                                                                                                                                               " u",
                                                                                                                                                                               " U"),
                                                                                                                                                                       " t",
                                                                                                                                                                       " T"),
                                                                                                                                                               " s",
                                                                                                                                                               " S"),
                                                                                                                                                       " r",
                                                                                                                                                       " R"),
                                                                                                                                               " q",
                                                                                                                                               " Q"),
                                                                                                                                       " p",
                                                                                                                                       " P"),
                                                                                                                               " o",
                                                                                                                               " O"),
                                                                                                                       " n",
                                                                                                                       " N"),
                                                                                                               " m",
                                                                                                               " M"),
                                                                                                       " l", " L"),
                                                                                               " k", " K"),
                                                                                       " j", " J"),
                                                                               " i", " I"),
                                                                       " h", " H"),
                                                               " g", " G"),
                                                       " f", " F"),
                                               " e", " E"),
                                       " d", " D"),
                               " c", " C"),
                       " b", " B"),
               " a", " A") AS converted_text
FROM user_content;