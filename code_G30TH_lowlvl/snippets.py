hv_pulser.py misc junk snippets


# t1ch3 = t1.channel(3, mode=Timer.OC_FORCED_ACTIVE,
#                           polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP4)
#        t1ch3 = t1.channel(3, pyb.Timer.OC_INACTIVE, compare=xfmr_pulse_w,
#                           polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP4)


AND , OR to set bits:

smcr = stm.mem16[stm.TIM2 + stm.TIM_SMCR]
smcr &= 0b1111111110001000
smcr |= 0b0000000001010101
stm.mem16[stm.TIM2 + stm.TIM_SMCR] = smcr

# Force CCMR1 register OC output to HIGH for all time...
ccmr1 = stm.mem16[stm.TIM1 + stm.TIM_CCMR1]
ccmr1 &= 0b1111111111011111
ccmr1 |= 0b0000000001010000
stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1

bin(ccmr1)[2:]
'11000000100000'


This part of timer.c deals with timer enabling,disabling:
 // Disable & clear the timer interrupt so that we don't trigger
            // an interrupt by initializing the timer.
            __HAL_TIM_DISABLE_IT(&self->tim, TIM_IT_UPDATE);
            HAL_TIM_Encoder_Init(&self->tim, &enc_config);
            __HAL_TIM_SetCounter(&self->tim, 0);
            if (self->callback != mp_const_none) {
                __HAL_TIM_CLEAR_FLAG(&self->tim, TIM_IT_UPDATE);
                __HAL_TIM_ENABLE_IT(&self->tim, TIM_IT_UPDATE);
            }
            HAL_TIM_Encoder_Start(&self->tim, TIM_CHANNEL_ALL);
break;
=============================
To use the non-interrupt enable/disable could be handy.  Also shows how
TIM_CHANNEL_ALL is used as list of created channels to start.
================
case CHANNEL_MODE_OC_FORCED_INACTIVE:
HAL_TIM_OC_Start_IT(&self->timer->tim, TIMER_CHANNEL(self));
all the cases get init then start, even _OC_FORCED_INACTIVE...makes no sense...

stm module timer constants:
'TIM_CR1', 'TIM_CR2', 'TIM_SMCR', 'TIM_DIER', 'TIM_SR', 'TIM_EGR', 'TIM_CCMR1', 'TIM_CCMR2', 'TIM_CCER', 'TIM_CNT', 'TIM_PSC', 'TIM_ARR', 'TIM_RCR', 'TIM_CCR1', 'TIM_CCR2', 'TIM_CCR3', 'TIM_CCR4', 'TIM_BDTR', 'TIM_DCR', 'TIM_DMAR', 'TIM_OR', 


>>> bin(ccmr1)
'0b101000000000000'
>>> stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1
>>> bin(stm.mem16[stm.TIM1 + stm.TIM_CCMR1])
'0b101000000000000'

>>> bin(ccmr1)[2:]
'101000000000000'
>>> stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
>>> stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
0

second time was because of running program, not a lack in infra.

The stm module is still undocumented, but there are really just the following:

Code: Select all
stm.mem32[address] = value # Writes a 32-bit value to the 4-bytes starting at 'address'
value = stm.mem32[address] # Reads a 32-bit value from the 4-bytes starting at 'address'

You can replace mem32 with mem16 or mem8. mem32 does 32-bit reads/writes. mem16 does 16 bit reads/writes, and mem8 does 8-bit reads/writes.

The remainder of the stm module is constants which are machine generated from the appropriate cmsis/devinc header for the processor for your board. You can see what constants were defined by doing:

Code: Select all
dir(stm)

# while True:
#     pyb.delay(5000)
#     debug_pin.value(0)
#     pyb.delay(5000)
#     debug_pin.value(1)



Take this whole interrupt callback out and do it with knowledge of t2ch2 only:


def t2ch1_neg_wndg_fall_cb(t2ch1):
    "negative winding PWM pulse falling edge interrupt"
    global neg_pulse_total
if neg_pulse_total > pulse_burstlen:
    pass  # Only way to here is previously set out = froz, neg_pulse_total + 1
else:
    if pin27.value() == 0:                       # neg pulse fall
        # disable t2ch1 output until changed again:
        # write LOW state to t2 CCMR1 reg OC1M pin JP25:
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1111111110001111  # upcnt channel out frozen OC1M "000"
        ccmr1 |= 0b0000000000000000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
        neg_pulse_total = neg_pulse_total + 1
    else:                                             # blanked neg pulse fall
        # turn output back on for next time.
        # write PWM mode 1 state to t2 CCMR1 reg OC1M pin JP25:
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1111111111101111        # upcnt channel out PWM1 OC1M "110"
        ccmr1 |= 0b0000000001100000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


====was goingto use for setup, but can use t2.counter(xfmr_pulse_w + 10)=====
# Put t2ch2 mode to FORCED_INACTIVE to start...
ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
ccmr1 &= 0b1100111111001111  # OC2M "100"....OC1M "100"
ccmr1 |= 0b0100000001000000
stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


# def t1ch1_burst_period_cb(t1ch1):
#     "toggle at much slower than burst length rate"
#     global push_puls_cnt
#     global pull_puls_cnt
#     push_puls_cnt = 0
#     pull_puls_cnt = 0

# t1ch1.callback(t1ch1_burst_period_cb)

