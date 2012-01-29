Hello System Calls!
===================

Getting the files:
------------------

If git is installed, you can just use:
<pre><code>
git clone git://github.com/cwru-eecs338/hello_syscalls.git
</code></pre>

Otherwise, you can download and extract the tarball using:
<pre><code>
wget --no-check-certificate -q -O - https://github.com/cwru-eecs338/hello_syscalls/tarball/master | tar -xzvf -
</code></pre>

Lessons:
--------
* Even basic operations like printing strings require system calls to the kernel
* Printing to standard out is treated like writing bytes to a special file
* In Linux, system calls are implemented by putting arguments into appropriate registers, then using an interrupt
