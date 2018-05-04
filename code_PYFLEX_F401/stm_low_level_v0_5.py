import stm


two_byte_mask = 0xFFFF
four_byte_mask = 0xFFFFFFFF


#######################################
# (CCMR1)
# 15     14 13 12   11    10     9 8      7    6 5 4      3     2      1 0
# OC2CE OC2M[2:0] OC2PE OC2FE CC2S[1:0] OC1CE OC1M[2:0] OC1PE OC1FE CC1S[1:0]
#
#     CC1S
# 00: CC1 channel is configured as output.
# 01: CC1 channel is configured as input, IC1 is mapped on TI1.
# 10: CC1 channel is configured as input, IC1 is mapped on TI2.
# 11: CC1 channel is configured as input, IC1 is mapped on TRC. This mode is working only if an internal trigger input is selected through TS bit (TIMx_SMCR register)
#
# OC1M: Output compare 1 mode
# These bits define the behavior of the output reference signal OC1REF from which OC1 and
# OC1N are derived. OC1REF is active high whereas OC1 and OC1N active level depends
# on CC1P and CC1NP bits.
#     000: Frozen - The comparison between the output compare register TIMx_CCR1 and the
# counter TIMx_CNT has no effect on the outputs.(this mode is used to generate a timing
# base).
#     001: Set channel 1 to active level on match. OC1REF signal is forced high when the counter
# TIMx_CNT matches the capture/compare register 1 (TIMx_CCR1).
#     010: Set channel 1 to inactive level on match. OC1REF signal is forced low when the
# counter TIMx_CNT matches the capture/compare register 1 (TIMx_CCR1).
#     011: Toggle - OC1REF toggles when TIMx_CNT=TIMx_CCR1.
#     100: Force inactive level - OC1REF is forced low.
#     101: Force active level - OC1REF is forced high.
#     110: PWM mode 1 - In upcounting, channel 1 is active as long as TIMx_CNT<TIMx_CCR1 else inactive.
#          In downcounting, channel 1 is inactive (OC1REF=‘0) as long as TIMx_CNT>TIMx_CCR1 else active (OC1REF=1).
#     111: PWM mode 2 - In upcounting, channel 1 is inactive as long as TIMx_CNT<TIMx_CCR1 else active. 
#          In downcounting, channel 1 is active as long as TIMx_CNT>TIMx_CCR1 else inactive.
# Note: In PWM mode 1 or 2, the OCREF level changes only when the result of the
# comparison changes or when the output compare mode switches from “frozen” mode to “PWM” mode.

TIM_CCMR1_CC1S_0 = 0
TIM_CCMR1_OC1M_0 = 4
TIM_CCMR_CCS__OUTPUT = 0b00
TIM_CCMR_OCM__PWM1 = 0b110 
TIM_CCMR_OCM__PWM2 = 0b111
TIM_SMCR_SMS__TRIGGER = 0b110
TIM_SMCR_SMS__GATED = 0b101

slave_tim_2_through_5 = { 'TIM1' : {'TIM5':0b000, 'TIM2':0b001, 'TIM3':0b010, 'TIM4':0b011},
                          'TIM2' : {'TIM1':0b000, 'TIM3':0b010, 'TIM4':0b011},
                          'TIM3' : {'TIM1':0b000, 'TIM2':0b001, 'TIM5':0b010, 'TIM4':0b011},
                          'TIM4' : {'TIM1':0b000, 'TIM2':0b001, 'TIM3':0b010, },
                          'TIM5' : {'TIM2':0b000, 'TIM3':0b001, 'TIM4':0b010, },
                          }


TIM_SMCR_SMS_0 = 0
TIM_SMCR_TS_0 = 4
TIM_SMCR_MSM = 7
def set_slave_mode_and_trigger_source(slave_tim_name, master_tim_name, mode='trigger'):
  # (SMCR)
  # 15  14  13 12     11 10 9 8  7    6 5 4  3    2 1 0
  # ETP ECE ETPS[1:0] ETF[3:0]   MSM TS[2:0] Res. SMS[2:0]
  # TS: Trigger selection
  #     This bit-field selects the trigger input to be used to synchronize the counter.
  #     000: Internal Trigger 0 (ITR0).
  #     001: Internal Trigger 1 (ITR1).
  #     010: Internal Trigger 2 (ITR2).
  #     011: Internal Trigger 3 (ITR3).
  #     100: TI1 Edge Detector (TI1F_ED)
  #     101: Filtered Timer Input 1 (TI1FP1)
  #     110: Filtered Timer Input 2 (TI2FP2)
  #     111: External Trigger input (ETRF)

  # Table 50. TIMx Internal trigger connection
  # Slave  TIM ITR0 (TS = 000)  ITR1 (TS = 001)  ITR2 (TS = 010)  ITR3 (TS = 011)
  # TIM1   TIM5_TRGO            TIM2_TRGO        TIM3_TRGO        TIM4_TRGO

  # Slave  TIM ITR0 (TS = 000)    ITR1 (TS = 001)   ITR2 (TS = 010)   ITR3 (TS = 011)
  # TIM2   TIM1_TRGO              Reserved          TIM3_TRGO         TIM4_TRGO
  # TIM3   TIM1_TRGO              TIM2_TRGO         TIM5_TRGO         TIM4_TRGO
  # TIM4   TIM1_TRGO              TIM2_TRGO         TIM3_TRGO         Reserved
  # TIM5   TIM2_TRGO              TIM3_TRGO         TIM4_TRGO         Reserved

  # SMS: Slave mode selection
  #     When external signals are selected the active edge of the trigger signal (TRGI) is linked to
  #     the polarity selected on the external input (see Input Control register and Control Register
  #     description.
  #     000: Slave mode disabled - if CEN = ‘1 then the prescaler is clocked directly by the internal clock.
  #     001: Encoder mode 1 - Counter counts up/down on TI2FP1 edge depending on TI1FP2 level.
  #     010: Encoder mode 2 - Counter counts up/down on TI1FP2 edge depending on TI2FP1 level.
  #     011: Encoder mode 3 - Counter counts up/down on both TI1FP1 and TI2FP2 edges
  #          depending on the level of the other input.
  #     100: Reset Mode - Rising edge of the selected trigger input (TRGI) reinitializes the counter
  #          and generates an update of the registers.
  #     101: Gated Mode - The counter clock is enabled when the trigger input (TRGI) is high. The
  #          counter stops (but is not reset) as soon as the trigger becomes low. Both start and stop of
  #          the counter are controlled.
  #     110: Trigger Mode - The counter starts at a rising edge of the trigger TRGI (but it is not
  #          reset). Only the start of the counter is controlled.
  #     111: External Clock Mode 1 - Rising edges of the selected trigger (TRGI) clock the counter.
  #          
  #          Note: The gated mode must not be used if TI1F_ED is selected as the trigger input (TS=100).
  #     Indeed, TI1F_ED outputs 1 pulse for each transition on TI1F, whereas the gated mode
  #     checks the level of the trigger signal.
  #     The clock of the slave timer must be enabled prior to receiving events from the master
  #     timer, and must not be changed on-the-fly while triggers are received from the master
  #     timer
  # (SMCR)
  # 15  14  13 12     11 10 9 8  7    6 5 4  3    2 1 0
  # ETP ECE ETPS[1:0] ETF[3:0]   MSM TS[2:0] Res. SMS[2:0]
  tim_base_address = getattr(stm, slave_tim_name)
  if mode=='trigger':
    slave_mode  = TIM_SMCR_SMS__TRIGGER << TIM_SMCR_SMS_0
  elif mode == 'external':
    slave_mode  = 0b111 << TIM_SMCR_SMS_0
  stm.mem16[tim_base_address + stm.TIM_SMCR] = (slave_mode
    | slave_tim_2_through_5[slave_tim_name][master_tim_name]<<TIM_SMCR_TS_0)

@micropython.native
def force_inactive_tim1():
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM1 + stm.TIM_CCMR1]
  ccmr1 &= 0b1111111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0000000001000000
  stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1

@micropython.native
def force_inactive_tim5():
  # Put (t2ch2/t2ch1) mode to FORCED_INACTIVE to start...
  # TODO which isn it, ch1 or ch2?
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM5 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0100000001000000
  stm.mem16[stm.TIM5 + stm.TIM_CCMR1] = ccmr1

@micropython.native
def force_inactive_tim2():
  # Put t2ch2  t2ch1 mode to FORCED_INACTIVE to start...
  ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0100000001000000
  stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1

@micropython.native
def force_inactive_tim4():
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM4 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0100000001000000
  stm.mem16[stm.TIM4 + stm.TIM_CCMR1] = ccmr1




def tim1_set_pwm1():
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM1 + stm.TIM_CCMR1]
  ccmr1 &= 0b1111111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0000000001100000
  stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1

def tim1_set_pwm2():
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM1 + stm.TIM_CCMR1]
  ccmr1 &= 0b1111111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0000000001110000
  stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1

def tim5_set_pwm1():
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM5 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0110000001100000
  stm.mem16[stm.TIM5 + stm.TIM_CCMR1] = ccmr1


def tim5_set_pwm2():
  # Put (t2ch2/t2ch1) mode to FORCED_INACTIVE to start...
  # TODO which isn it, ch1 or ch2?
  # TODO link to PDF and page number for register field description
  ccmr1 = stm.mem16[stm.TIM5 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0111000001110000
  stm.mem16[stm.TIM5 + stm.TIM_CCMR1] = ccmr1

def tim2_set_pwm2():
  # Put (t2ch2/t2ch1) mode to FORCED_INACTIVE to start...
  # TODO which isn it, ch1 or ch2?
  # TODO link to PDF and page number for register field description
  ## 111: PWM mode 2 - In upcounting, channel 1 is inactive as long as TIMx_CNT<TIMx_CCR1
  ## else active. In downcounting, channel 1 is active as long as TIMx_CNT>TIMx_CCR1 else
  ## inactive.
  ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0111000001110000
  stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


def tim2_set_pwm1():
  # Put t2ch2  t2ch1 mode to FORCED_INACTIVE to start...
  ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
  ccmr1 &= 0b1000111110001111  # OC2M "100"....OC1M "100"
  ccmr1 |= 0b0110000001100000
  stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


APB2_TIM1EN = 0
APB1_TIM2EN = 0
APB1_TIM3EN = 1
APB1_TIM4EN = 2
APB1_TIM5EN = 3
APB1_PWREN = 28
APB2_ADC1EN = 8


def tim2_disable():
  stm.mem32[stm.RCC + stm.RCC_APB1ENR] &= (~(1<<TIM2EN)) & four_byte_mask


def tim5_disable():
  stm.mem32[stm.RCC + stm.RCC_APB1ENR] &= (~(1<<TIM5EN)) & four_byte_mask


def enable_gpio_and_timers():
  # (RCC_AHB1ENR)
  # 31 30 29 28 27 26 25 24 23 22     21     20 19 18 17 16
  # Reserved                   DMA2EN DMA1EN Reserved
  # 15 14 13 12    11 10 9 8 7       6 5      4       3       2       1       0
  # Reserved CRCEN Reserved  GPIOHEN Reserved GPIOEEN GPIODEN GPIOCEN GPIOBEN GPIOAEN
  stm.mem32[stm.RCC + stm.RCC_AHB1ENR] = (0
    | 1<<0   #GPIOAEN
    | 1<<1   #GPIOBEN
    | 1<<4 ) #GPIOEEN

  # (RCC_APB1ENR)
  # 31 30 29  28     27 26 25 24  23     22     21     20 19 18  17       16
  # Reserved  PWREN  Reserved     I2C3EN I2C2EN I2C1EN Reserved  USART2EN Reserved
  # 15     14     13 12    11      10 9 8 7 6 5 4  3      2      1      0
  # SPI3EN SPI2EN Reserved WWDGEN  Reserved        TIM5EN TIM4EN TIM3EN TIM2EN
  stm.mem32[stm.RCC + stm.RCC_APB1ENR] |=(0 
                                          | 1<<APB1_TIM2EN
                                          | 1<<APB1_TIM4EN
                                          | 1<<APB1_TIM5EN
                                          | 1<<APB1_PWREN
                                          | 1<<APB1_TIM3EN)

  # 31 30 29 28 27 26 25 24 23 22 21 20 19  18      17      16
  #Reserved                                 TIM11EN TIM10EN TIM9EN
  #15       14       13     12     11     10 9     8      7 6      5        4        3 2 1    0
  #Reserved SYSCFGEN SPI4EN SPI1EN SDIOEN Reserved ADC1EN Reserved USART6EN USART1EN Reserved TIM1EN
  stm.mem32[stm.RCC + stm.RCC_APB2ENR] |= 1<<APB2_TIM1EN # TIM1EN



# 31 30        29 28        27 26        25 24        23 22        21 20        19 18       17 16
# MODER15[1:0] MODER14[1:0] MODER13[1:0] MODER12[1:0] MODER11[1:0] MODER10[1:0] MODER9[1:0] MODER8[1:0]
# 15 14       13 12       11 10       9 8         7 6         5 4         3 2         1 0
# MODER7[1:0] MODER6[1:0] MODER5[1:0] MODER4[1:0] MODER3[1:0] MODER2[1:0] MODER1[1:0] MODER0[1:0]

#     Bits 2y:2y+1 MODERy[1:0]: Port x configuration bits (y = 0..15)
#         These bits are written by software to configure the I/O direction mode.
GPIO_Mode_IN = 0b00# : Input (reset state)
GPIO_Mode_GP = 0b01# : General purpose output mode
GPIO_Mode_AF = 0b10# : Alternate function mode
GPIO_Mode_AN = 0b11# : Analog mode

# enable_pa0_pa1_af()  not used in top level prgrm   ----delete-me?-----
# def enable_pa0_pa1_af():
#   stm.mem32[stm.GPIOA + stm.GPIO_MODER] = (stm.mem32[stm.GPIOA + stm.GPIO_MODER]
#     & (~(0b11<<0 | 0b11<<2)& four_byte_mask) #GPIO_MODER_MODER3
#   ) | (0
#     | (GPIO_Mode_AF<<0) #GPIO_Mode_AF  PA0
#     | (GPIO_Mode_AF<<2) #GPIO_Mode_AF  PA1
#   )
#             ----delete-me?-----    

# commented out to test use of pyb.Pin.AF_PP
# def enable_pa0_pa1_input():
#   stm.mem32[stm.GPIOA + stm.GPIO_MODER] = (stm.mem32[stm.GPIOA + stm.GPIO_MODER]
#   & (~(0b11<<0 | 0b11<<2)& four_byte_mask) #GPIO_MODER_MODER3
#   ) | (0
#     | (GPIO_Mode_IN<<0) 
#     | (GPIO_Mode_IN<<2) 
#   )


# (AFRL)
# 31 30 29 28  27 26 25 24  23 22 21 20  19 18 17 16
# AFRL7[3:0]   AFRL6[3:0]   AFRL5[3:0]   AFRL4[3:0]
# 15 14 13 12  11 10 9 8   7 6 5 4    3 2 1 0
# AFRL3[3:0]   AFRL2[3:0]  AFRL1[3:0] AFRL0[3:0]

# AFRL/AFRH       # AFRL/AFRH
AF0 = 0b0000      # AF0  (system)
AF1 = 0b0001      # AF1  (TIM1/TIM2)
AF2 = 0b0010      # AF2  (TIM3..5)
AF3 = 0b0011      # AF3  (TIM9..11)
AF4 = 0b0100      # AF4  (I2C1..3)
AF5 = 0b0101      # AF5  (SPI1..4)
AF6 = 0b0110      # AF6  (SPI3)
AF7 = 0b0111      # AF7  (USART1..2)
AF8 = 0b1000      # AF8  (USART6)
AF9 = 0b1001      # AF9  (I2C2..3)
AF10 = 0b1010     # AF10 (OTG_FS)
AF11 = 0b1011     # AF11 ()
AF12 = 0b1100     # AF12 (SDIO)
AF13 = 0b1101     # AF13 ()
AF14 = 0b1110     # AF14 ()
AF15 = 0b1111     # AF15 (EVENTOUT)

AFRL0_0 = 0
AFRL1_0 = 4

# commented out to test use of pyb.Pin.AF_PP
# def connect_pa0_and_pa1_to_tim2_and_tim5():
  """ PA0 set to AF1 --> TIM2_CH1/TIM2_ETR"""
  """ PA1 set to AF1 --> TIM2_CH2"""
#   stm.mem32[stm.GPIOA + stm.GPIO_AFR0] = (stm.mem32[stm.GPIOA + stm.GPIO_AFR0]
#     & (~(0b1111<<AFRL0_0 | 0b1111<<AFRL1_0)& four_byte_mask) #GPIO_AFRL_AFRL3
#  ) | (0
#     | (AF1 <<AFRL0_0)  # AFRL3_0 # --> TIM2_CH2
#     | (AF2 <<AFRL1_0)
#   )

def enable_pb13_af_and_connect_to_tim1():
  """# PB13 -- just for status of n-pulse timer"""
  #print(bin(stm.mem32[stm.GPIOB + stm.GPIO_MODER]))
  stm.mem32[stm.GPIOB + stm.GPIO_MODER] = (stm.mem32[stm.GPIOB + stm.GPIO_MODER]
    & (~(0b1111<<26)& four_byte_mask)  # MODER8      #GREEN LED
  ) | (0
    | (GPIO_Mode_AF<<26)
  )

  # 31 30 29 28  27 26 25 24  23 22 21 20  19 18 17 16
  # AFRH15[3:0]  AFRH14[3:0]  AFRH13[3:0]  AFRH12[3:0]
  # 15 14 13 12  11 10 9 8    7 6 5 4     3 2 1 0
  # AFRH11[3:0]  AFRH10[3:0]  AFRH9[3:0]  AFRH8[3:0]
  stm.mem32[stm.GPIOB + stm.GPIO_AFR1] = (stm.mem32[stm.GPIOB + stm.GPIO_AFR1]
    & ((~(0b1111)& four_byte_mask)<<20)  # PB13 -- just for status of n-pulse timer
  ) | (0
    | (AF1 <<20)   # --> TIM1_CH1N
  )


# as long as both TIM tick at AHB freq, the TIM's will tick at the same rate;
# should there be any APB divider impacting TIM input clock freq,
# this has to be factored in (individually per timer, as they are on different APBs)
def adjust_prescalers(prescale):
  stm.mem16[stm.TIM1 + stm.TIM_PSC] = prescale
  stm.mem16[stm.TIM2 + stm.TIM_PSC] = prescale
  stm.mem16[stm.TIM3 + stm.TIM_PSC] = prescale
  stm.mem16[stm.TIM5 + stm.TIM_PSC] = prescale


def adjust_tim5(period, width):
  stm.mem32[stm.TIM5 + stm.TIM_ARR] = period
  stm.mem32[stm.TIM5 + stm.TIM_CCR2] = period - width

def get_tim5_width():
  return stm.mem32[stm.TIM5 + stm.TIM_CCR2]

def get_tim5_width1():
  return stm.mem32[stm.TIM5 + stm.TIM_ARR] - stm.mem32[stm.TIM5 + stm.TIM_CCR2]


def adjust_tim2(period, width):
  stm.mem32[stm.TIM2 + stm.TIM_ARR] = period
  stm.mem32[stm.TIM2 + stm.TIM_CCR1] = period - width

def adjust_tim1_pulses(number_pulses):
  number_pulses = (number_pulses * 2) - 1
  stm.mem16[stm.TIM1 + stm.TIM_RCR] = (stm.mem16[stm.TIM1 + stm.TIM_RCR] 
                                      & 0xff<<8) | ((number_pulses - 1) & 0xff)

def adjust_tim1(period, width, number_pulses):
  stm.mem16[stm.TIM1 + stm.TIM_ARR] = period
  stm.mem16[stm.TIM1 + stm.TIM_CCR1] = width
  if number_pulses != None:
    adjust_tim1_pulses(number_pulses)

# (CR1)
# 15 14 13 12 11 10   9 8     7   6 5  4   3   2    1   0
#       Reserved    CKD[1:0] ARPE CMS DIR OPM URS UDIS CEN
TIM_CR1_CEN = 0
TIM_CR1_UDIS = 1
TIM_CR1_URS = 2
TIM_CR1_OPM = 3
TIM_CR1_CMS = 5
TIM_CR1_DIR = 4

TIM_CCMR1_OC1CE = 7
TIM_CCMR1_OC2CE = 15


def setup_slave_timer(slave_tim_name, channel_num, master_tim_name, prescaler, period, width):
    channel_num = channel_num - 1
    tim_base_address = getattr(stm, slave_tim_name)
    stm.mem16[tim_base_address + stm.TIM_CR1] &= (~1) & two_byte_mask # disable CEN
    stm.mem16[tim_base_address + stm.TIM_CR1] |= (0
                                                  #| 0b11<<TIM_CR1_CMS #up down
                                                  | 1<<7 )# ARPE
    stm.mem16[tim_base_address + stm.TIM_PSC] = prescaler
    stm.mem32[tim_base_address + stm.TIM_ARR] = period
    
    stm.mem32[tim_base_address + stm.TIM_CNT] = 0

    stm.mem32[tim_base_address + stm.TIM_CCR1] = period - width
    stm.mem32[tim_base_address + stm.TIM_CCR2] = period - width

    # (CCMR1)
    # 15     14 13 12   11    10     9 8      7    6 5 4      3     2      1 0
    # OC2CE OC2M[2:0] OC2PE OC2FE CC2S[1:0] OC1CE OC1M[2:0] OC1PE OC1FE CC1S[1:0]
    stm.mem16[tim_base_address + stm.TIM_CCMR1] = (0 #0b111<<12  #| 1<<15 #(0
     # | (0<<(8*channel_num)+0)  # CC1S --  output compare on CH1  (THIS DOES NOTHING???)
       | (1<<(8*channel_num)+3)  # PWM2 mode on CH1 (OC1M)
       | (TIM_CCMR_OCM__PWM2<<(8*channel_num)+4))  # PWM2 mode on CH1 (OC1M)

    set_slave_mode_and_trigger_source(slave_tim_name, master_tim_name)

    stm.mem16[tim_base_address + stm.TIM_EGR] |= (1) # set bit 0 -- UG
    # (TIM2 CCER)
    # 15    14   13   12   11    10   9    8    7     6    5    4    3     2    1    0
    # CC4NP Res. CC4P CC4E CC3NP Res. CC3P CC3E CC2NP Res. CC2P CC2E CC1NP Res. CC1P CC1E
    # bin(stm.mem16[stm.TIM5 + stm.TIM_CCER])
    stm.mem16[tim_base_address + stm.TIM_CCER] = (0
      #| (1 << (4*channel_num + 1))   # CC1P -- invert TIM2_CH1 (see description above) 
      #| (1 << (4*channel_num + 1))   # CC1P -- invert TIM2_CH1 (see description above) 
      | (1 << (4*channel_num + 0)))  # CC2E -- enable TIM2_CH2
    return tim_base_address


def setup_n_pulse_kickoff_timer(tim_name, channel_num, prescaler, period, width):
    channel_num = channel_num - 1
    tim_base_address = getattr(stm, tim_name)
    stm.mem16[tim_base_address + stm.TIM_CR1] &= (~1) & two_byte_mask
    stm.mem16[tim_base_address + stm.TIM_PSC] = prescaler
    stm.mem32[tim_base_address + stm.TIM_ARR] = period
    stm.mem32[tim_base_address + stm.TIM_CCR1] = period - width
    stm.mem32[tim_base_address + stm.TIM_CCR2] = period - width
    stm.mem32[tim_base_address + stm.TIM_CNT] = 0

    stm.mem16[tim_base_address + stm.TIM_SMCR] |= 1<<TIM_SMCR_MSM
    # (CCMR1)
    # 15     14 13 12   11    10     9 8      7    6 5 4      3     2      1 0
    # OC2CE OC2M[2:0] OC2PE OC2FE CC2S[1:0] OC1CE OC1M[2:0] OC1PE OC1FE CC1S[1:0]
        # (CCMR1)
    stm.mem16[tim_base_address + stm.TIM_CCMR1] = (0
    | (1<<(8*channel_num)+3) # PRE-ENABLE
    | (TIM_CCMR_OCM__PWM1<<(8*channel_num)+4)) # PWM MODE

    # 15 14 13 12 11 10 9 8 7     6 5 4     3   2 1 0
    #        Reserved       TI1S MMS[2:0] CCDS Reserved
    # Bits 6:4 MMS[2:0]: Master mode selection
    #     These bits allow to select the information to be sent in master mode to slave timers for
    #     synchronization (TRGO). The combination is as follows:
    #     000: Reset - the UG bit from the TIMx_EGR register is used as trigger output (TRGO). If the
    #          reset is generated by the trigger input (slave mode controller configured in reset mode) then
    #          the signal on TRGO is delayed compared to the actual reset.
    #     001: Enable - the Counter enable signal, CNT_EN, is used as trigger output (TRGO). It is
    #          useful to start several timers at the same time or to control a window in which a slave timer is
    #          enabled. The Counter Enable signal is generated by a logic OR between CEN control bit
    #          and the trigger input when configured in gated mode.
    #          When the Counter Enable signal is controlled by the trigger input, there is a delay on TRGO,
    #          except if the master/slave mode is selected (see the MSM bit description in TIMx_SMCR
    #          register).
    #     010: Update - The update event is selected as trigger output (TRGO). For instance a master
    #          timer can then be used as a prescaler for a slave timer.
    #     011: Compare Pulse - The trigger output send a positive pulse when the CC1IF flag is to be
    #          set (even if it was already high), as soon as a capture or a compare match occurred.
    #          (TRGO)
    #     100: Compare - OC1REF signal is used as trigger output (TRGO)
    #     101: Compare - OC2REF signal is used as trigger output (TRGO)
    #     110: Compare - OC3REF signal is used as trigger output (TRGO)
    #     111: Compare - OC4REF signal is used as trigger output (TRGO)
    
    ENABLE =  0b001
    UPDATE =  0b010
    OC1REF =  0b100
    OC2REF =  0b101
    TIM_CR2_MMS_0 = 4
    stm.mem16[tim_base_address + stm.TIM_CR2] = (stm.mem16[tim_base_address + stm.TIM_CR2]
    &(~(0b111<<TIM_CR2_MMS_0) & two_byte_mask)) | (ENABLE  << TIM_CR2_MMS_0)   # select OC1Ref as TRGO
    stm.mem16[tim_base_address + stm.TIM_CR1] &= ~(0b11<<5)&0xffff # CENTER-aligned
    stm.mem16[tim_base_address + stm.TIM_CR1] |= (0b1<<5)# CENTER-aligned
    
    #stm.mem16[tim_base_address + stm.TIM_EGR] |= (1) # set bit 0 -- UG

    # (TIM2 CCER)
    # 15    14   13   12   11    10   9    8    7     6    5    4    3     2    1    0
    # CC4NP Res. CC4P CC4E CC3NP Res. CC3P CC3E CC2NP Res. CC2P CC2E CC1NP Res. CC1P CC1E
    stm.mem16[tim_base_address + stm.TIM_CCER] |= (0
      #| (1 << 1)  # CC1P -- invert TIM2_CH1 (see description above)
      #|1<<4 | 1<<5 | 1<<7  # CC2E # CC2P # CC2NP
      | (1 << (4*channel_num)))  # CCxE -- enable normal output
    return tim_base_address

