-- 1972. First and Last Call On the Same Day

-- Hard

-- Table: Calls
--
-- +--------------+----------+
-- | Column Name  | Type     |
-- +--------------+----------+
-- | caller_id    | int      |
-- | recipient_id | int      |
-- | call_time    | datetime |
-- +--------------+----------+
-- (caller_id, recipient_id, call_time) is the primary key (combination of columns with unique values) for this table.
-- Each row contains information about the time of a phone call between caller_id and recipient_id.
--
--
-- Write a solution to report the IDs of the users whose first and last calls on any day were with the same person. Calls are counted regardless of being the caller or the recipient.
--
-- Return the result table in any order.
--
-- The result format is in the following example.
--
--
--
-- Example 1:
--
-- Input:
-- Calls table:
-- +-----------+--------------+---------------------+
-- | caller_id | recipient_id | call_time           |
-- +-----------+--------------+---------------------+
-- | 8         | 4            | 2021-08-24 17:46:07 |
-- | 4         | 8            | 2021-08-24 19:57:13 |
-- | 5         | 1            | 2021-08-11 05:28:44 |
-- | 8         | 3            | 2021-08-17 04:04:15 |
-- | 11        | 3            | 2021-08-17 13:07:00 |
-- | 8         | 11           | 2021-08-17 22:22:22 |
-- +-----------+--------------+---------------------+
-- Output:
-- +---------+
-- | user_id |
-- +---------+
-- | 1       |
-- | 4       |
-- | 5       |
-- | 8       |
-- +---------+
-- Explanation:
-- On 2021-08-24, the first and last call of this day for user 8 was with user 4. User 8 should be included in the answer.
-- Similarly, user 4 on 2021-08-24 had their first and last call with user 8. User 4 should be included in the answer.
-- On 2021-08-11, user 1 and 5 had a call. This call was the only call for both of them on this day. Since this call is the first and last call of the day for both of them, they should both be included in the answer.answer

with A
         as (select id1, id2, date (call_time) as call_date, row_number() over(partition by id1, date (call_time) order by call_time) as rni, row_number() over(partition by id1, date (call_time) order by call_time desc) as rnd
from (
    select caller_id as id1, recipient_id as id2, call_time from Calls
    union all
    select recipient_id as id1, caller_id as id2, call_time from Calls) t), B as (
select id1, id2, call_date
from A
where rni = 1)
    , C as (
select id1, id2, call_date
from A
where rnd = 1)
select distinct b.id1 as user_id
from B b
         join C c on b.call_date = c.call_date and b.id2 = c.id2 and b.id1 = c.id1;