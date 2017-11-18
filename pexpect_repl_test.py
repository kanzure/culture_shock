import pexpect,sys,time,re
a=pexpect.spawn('picocom /dev/ttyACM0')
# uncomment the next line to log all the interactions to the screen
#a.logfile=sys.stdout
a.expect('Terminal ready')
time.sleep(1)
a.sendline('\r')
a.expect('>>>')
a.sendcontrol('d')
a.expect('>>>')
# call the pulse function
a.sendline('pulse()\r')
a.expect('>>>')

adc_vals_cmd = 'adc_vals\r'
a.sendline(adc_vals_cmd)
a.expect('>>>')

#print 'after ({})'.format(a.after)
#print 'before ({})'.format(a.before)

# capture anything in between square brackets
matches = re.match(r'[^\[]*\[([^\]]+)\]', a.before)
if matches:
  csv = matches.groups()[0]
  new_list = [s.strip() for s in csv.split(',')]
  print 'before ({})'.format(new_list)
