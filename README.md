Copy the given thread-analyze-with-rolling.sh file to your pod and move it to a separate directory.
Do not execute this file under the product home.
Create new directory and move the above file to that directory.
Execute the script.
Run the script according to the following format.
--Format--
sh thread-analyze-with-rolling.sh <PID> <number_of_threads> <timegap> <delete_files_older_than_given_minutes>
-- Example --
sh thread-analyze-with-rolling.sh 10377 10 5s 30

this will print 10 thread dumps with the 5s time gap continuously and each time if any file is older than 30 minutes will be deleted.

References
https://gist.github.com/bsenduran/02e8bf024fcaaa7707a6bb2321e097a8#file-thread-analyze-sh
