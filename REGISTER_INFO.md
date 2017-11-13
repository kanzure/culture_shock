Table of Contents
=================

* [Registers](#registers)
   * [11.12.1 ADC status register (ADC_SR)](#11121-adc-status-register-adc_sr)
   * [11.12.2 ADC control register 1 (ADC_CR1)](#11122-adc-control-register-1-adc_cr1)
   * [11.12.3 ADC control register 2 (ADC_CR2)](#11123-adc-control-register-2-adc_cr2)
   * [11.12.4 ADC sample time register 1 (ADC_SMPR1)](#11124-adc-sample-time-register-1-adc_smpr1)
   * [11.12.5 ADC sample time register 2 (ADC_SMPR2)](#11125-adc-sample-time-register-2-adc_smpr2)
   * [11.12.6 ADC injected channel data offset register x (ADC_JOFRx) (x=1..4)](#11126-adc-injected-channel-data-offset-register-x-adc_jofrx-x14)
   * [11.12.7 ADC watchdog higher threshold register (ADC_HTR)](#11127-adc-watchdog-higher-threshold-register-adc_htr)
   * [11.12.8 ADC watchdog lower threshold register (ADC_LTR)](#11128-adc-watchdog-lower-threshold-register-adc_ltr)
   * [11.12.9 ADC regular sequence register 1 (ADC_SQR1)](#11129-adc-regular-sequence-register-1-adc_sqr1)
   * [11.12.10 ADC regular sequence register 2 (ADC_SQR2)](#111210-adc-regular-sequence-register-2-adc_sqr2)
   * [11.12.11 ADC regular sequence register 3 (ADC_SQR3)](#111211-adc-regular-sequence-register-3-adc_sqr3)
   * [11.12.12 ADC injected sequence register (ADC_JSQR)](#111212-adc-injected-sequence-register-adc_jsqr)
   * [11.12.13 ADC injected data register x (ADC_JDRx) (x= 1..4)](#111213-adc-injected-data-register-x-adc_jdrx-x-14)
   * [11.12.14 ADC regular data register (ADC_DR)](#111214-adc-regular-data-register-adc_dr)
   * [11.12.15 ADC common control register (ADC_CCR)](#111215-adc-common-control-register-adc_ccr)


## Registers
### 11.12.1 ADC status register (ADC_SR)
5     4     3     2     1     0
OVR   STRT  JSTRT JEOC  EOC   AWD
rc_w0 rc_w0 rc_w0 rc_w0 rc_w0 rc_w0

* Bits 31:6 Reserved, must be kept at reset value.
* Bit 5 OVR: Overrun
  * This bit is set by hardware when data are lost . It is cleared by software. Overrun detection is enabled only when DMA = 1 or EOCS = 1.
    * 0: No overrun occurred
    * 1: Overrun has occurred
* Bit 4 STRT: Regular channel start flag
  * This bit is set by hardware when regular channel conversion starts. It is cleared by software.
    * 0: No regular channel conversion started
    * 1: Regular channel conversion has started
* Bit 3 JSTRT: Injected channel start flag
  * This bit is set by hardware when injected group conversion starts. It is cleared by software.
    * 0: No injected group conversion started
    * 1: Injected group conversion has started
* Bit 2 JEOC: Injected channel end of conversion
  * This bit is set by hardware at the end of the conversion of all injected channels in the group. It is cleared by software.
    * 0: Conversion is not complete
    * 1: Conversion complete
* Bit 1 EOC: Regular channel end of conversion
  * This bit is set by hardware at the end of the conversion of a regular group of channels. It is cleared by software or by reading the ADC_DR register.
    * 0: Conversion not complete (EOCS=0), or sequence of conversions not complete (EOCS=1)
    * 1: Conversion complete (EOCS=0), or sequence of conversions complete (EOCS=1)
* Bit 0 AWD: Analog watchdog flag
  * This bit is set by hardware when the converted voltage crosses the values programmed in the ADC_LTR and ADC_HTR registers. It is cleared by software.
    * 0: No analog watchdog event occurred
    * 1: Analog watchdog event occurred

### 11.12.2 ADC control register 1 (ADC_CR1)
* Address offset: 0x04
* Reset value: 0x0000 0000

* Bit 31 Reserved, must be kept at reset value.
* Bit 30 SWSTART: Start conversion of regular channels
  * This bit is set by software to start conversion and cleared by hardware as soon as the conversion starts.
    * 0: Reset state
    * 1: Starts conversion of regular channels
  * Note: This bit can be set only when ADON = 1 otherwise no conversion is launched.
* Bits 29:28 EXTEN: External trigger enable for regular channels
  * These bits are set and cleared by software to select the external trigger polarity and enable the trigger of a regular group.
    * 00: Trigger detection disabled
    * 01: Trigger detection on the rising edge
    * 10: Trigger detection on the falling edge
    * 11: Trigger detection on both the rising and falling edges
* Bits 27:24 EXTSEL[3:0]: External event select for regular group
  * These bits select the external event used to trigger the start of conversion of a regular group:
    * 0000: Timer 1 CC1 event
    * 0001: Timer 1 CC2 event
    * 0010: Timer 1 CC3 event
    * 0011: Timer 2 CC2 event
    * 0100: Timer 2 CC3 event
    * 0101: Timer 2 CC4 event
    * 0110: Timer 2 TRGO event
    * 0111: Timer 3 CC1 event
    * 1000: Timer 3 TRGO event
    * 1001: Timer 4 CC4 event
    * 1010: Timer 5 CC1 event
    * 1011: Timer 5 CC2 event
    * 1100: Timer 5 CC3 event
    * 1101: Reserved
    * 1110: Reserved
    * 1111: EXTI line11
* Bit 23 Reserved, must be kept at reset value.
* Bit 22 JSWSTART: Start conversion of injected channels
  * This bit is set by software and cleared by hardware as soon as the conversion starts.
    * 0: Reset state
    * 1: Starts conversion of injected channels
  * Note: This bit can be set only when ADON = 1 otherwise no conversion is launched.
* Bits 21:20 JEXTEN: External trigger enable for injected channels
  * These bits are set and cleared by software to select the external trigger polarity and enable the trigger of an injected group.
    * 00: Trigger detection disabled
    * 01: Trigger detection on the rising edge
    * 10: Trigger detection on the falling edge
    * 11: Trigger detection on both the rising and falling edges
* Bits 19:16 JEXTSEL[3:0]: External event select for injected group
  * These bits select the external event used to trigger the start of conversion of an injected group.
    * 0000: Timer 1 CC4 event
    * 0001: Timer 1 TRGO event
    * 0010: Timer 2 CC1 event
    * 0011: Timer 2 TRGO event
    * 0100: Timer 3 CC2 event
    * 0101: Timer 3 CC4 event
    * 0110: Timer 4 CC1 event
    * 0111: Timer 4 CC2 event
    * 1000: Timer 4 CC3 event
    * 1001: Timer 4 TRGO event
    * 1010: Timer 5 CC4 event
    * 1011: Timer 5 TRGO event
    * 1100: Reserved
    * 1101: Reserved
    * 1110: Reserved
    * 1111: EXTI line15
* Bits 15:12 Reserved, must be kept at reset value.
* Bit 11 ALIGN: Data alignment
  * This bit is set and cleared by software. Refer to Figure 35 and Figure 36.
    * 0: Right alignment
    * 1: Left alignment
* Bit 10 EOCS: End of conversion selection
  * This bit is set and cleared by software.
    * 0: The EOC bit is set at the end of each sequence of regular conversions. Overrun detection is enabled only if DMA=1.
    * 1: The EOC bit is set at the end of each regular conversion. Overrun detection is enabled.
* Bit 9 DDS: DMA disable selection (for single ADC mode)
  * This bit is set and cleared by software.
    * 0: No new DMA request is issued after the last transfer (as configured in the DMA controller)
    * 1: DMA requests are issued as long as data are converted and DMA=1
* Bit 8 DMA: Direct memory access mode (for single ADC mode)
  * This bit is set and cleared by software. Refer to the DMA controller chapter for more details.
    * 0: DMA mode disabled
    * 1: DMA mode enabled
* Bits 7:2 Reserved, must be kept at reset value.
* Bit 1 CONT: Continuous conversion
  * This bit is set and cleared by software. If it is set, conversion takes place continuously until it is cleared.
    * 0: Single conversion mode
    * 1: Continuous conversion mode
* Bit 0 ADON: A/D Converter ON / OFF
  * This bit is set and cleared by software.
  * Note:
    * 0: Disable ADC conversion and go to power down mode
    * 1: Enable ADC

### 11.12.3 ADC control register 2 (ADC_CR2)
* Address offset: 0x08
* Reset value: 0x0000 0000
* Bit 31 Reserved, must be kept at reset value.
* Bit 30 SWSTART: Start conversion of regular channels
  * This bit is set by software to start conversion and cleared by hardware as soon as the conversion starts.
    * 0: Reset state
    * 1: Starts conversion of regular channels
  * Note: This bit can be set only when ADON = 1 otherwise no conversion is launched.
* Bits 29:28 EXTEN: External trigger enable for regular channels
  * These bits are set and cleared by software to select the external trigger polarity and enable the trigger of a regular group.
    * 00: Trigger detection disabled
    * 01: Trigger detection on the rising edge
    * 10: Trigger detection on the falling edge
    * 11: Trigger detection on both the rising and falling edges
* Bits 27:24 EXTSEL[3:0]: External event select for regular group
  * These bits select the external event used to trigger the start of conversion of a regular group:
    * 0000: Timer 1 CC1 event
    * 0001: Timer 1 CC2 event
    * 0010: Timer 1 CC3 event
    * 0011: Timer 2 CC2 event
    * 0100: Timer 2 CC3 event
    * 0101: Timer 2 CC4 event
    * 0110: Timer 2 TRGO event
    * 0111: Timer 3 CC1 event
    * 1000: Timer 3 TRGO event
    * 1001: Timer 4 CC4 event
    * 1010: Timer 5 CC1 event
    * 1011: Timer 5 CC2 event
    * 1100: Timer 5 CC3 event
    * 1101: Reserved
    * 1110: Reserved
    * 1111: EXTI line11
* Bit 23 Reserved, must be kept at reset value.
* Bit 22 JSWSTART: Start conversion of injected channels
  * This bit is set by software and cleared by hardware as soon as the conversion starts.
    * 0: Reset state
    * 1: Starts conversion of injected channels
  * Note: This bit can be set only when ADON = 1 otherwise no conversion is launched.
* Bits 21:20 JEXTEN: External trigger enable for injected channels
  * These bits are set and cleared by software to select the external trigger polarity and enable the trigger of an injected group.
    * 00: Trigger detection disabled
    * 01: Trigger detection on the rising edge
    * 10: Trigger detection on the falling edge
    * 11: Trigger detection on both the rising and falling edges
* Bits 19:16 JEXTSEL[3:0]: External event select for injected group
  * These bits select the external event used to trigger the start of conversion of an injected group.
    * 0000: Timer 1 CC4 event
    * 0001: Timer 1 TRGO event
    * 0010: Timer 2 CC1 event
    * 0011: Timer 2 TRGO event
    * 0100: Timer 3 CC2 event
    * 0101: Timer 3 CC4 event
    * 0110: Timer 4 CC1 event
    * 0111: Timer 4 CC2 event
    * 1000: Timer 4 CC3 event
    * 1001: Timer 4 TRGO event
    * 1010: Timer 5 CC4 event
    * 1011: Timer 5 TRGO event
    * 1100: Reserved
    * 1101: Reserved
    * 1110: Reserved
    * 1111: EXTI line15
* Bits 15:12 Reserved, must be kept at reset value.
* Bit 11 ALIGN: Data alignment
  * This bit is set and cleared by software. Refer to Figure 35 and Figure 36.
    * 0: Right alignment
    * 1: Left alignment
* Bit 10 EOCS: End of conversion selection
  * This bit is set and cleared by software.
    * 0: The EOC bit is set at the end of each sequence of regular conversions. Overrun detection is enabled only if DMA=1.
    * 1: The EOC bit is set at the end of each regular conversion. Overrun detection is enabled.
* Bit 9 DDS: DMA disable selection (for single ADC mode)
  * This bit is set and cleared by software.
    * 0: No new DMA request is issued after the last transfer (as configured in the DMA controller)
    * 1: DMA requests are issued as long as data are converted and DMA=1
* Bit 8 DMA: Direct memory access mode (for single ADC mode)
  * This bit is set and cleared by software. Refer to the DMA controller chapter for more details.
    * 0: DMA mode disabled
    * 1: DMA mode enabled
* Bits 7:2 Reserved, must be kept at reset value.
* Bit 1 CONT: Continuous conversion
  * This bit is set and cleared by software. If it is set, conversion takes place continuously until it is cleared.
    * 0: Single conversion mode
    * 1: Continuous conversion mode
* Bit 0 ADON: A/D Converter ON / OFF
  * This bit is set and cleared by software.
  * Note:
    * 0: Disable ADC conversion and go to power down mode
    * 1: Enable ADC

### 11.12.4 ADC sample time register 1 (ADC_SMPR1)
* Bits 31: 27 Reserved, must be kept at reset value.
* Bits 26:0 SMPx[2:0]: Channel x sampling time selection
  * These bits are written by software to select the sampling time individually for each channel.
  * During sampling cycles, the channel selection bits must remain unchanged.
  * Note:
    * 000: 3 cycles
    * 001: 15 cycles
    * 010: 28 cycles
    * 011: 56 cycles
    * 100: 84 cycles
    * 101: 112 cycles
    * 110: 144 cycles
    * 111: 480 cycles
### 11.12.5 ADC sample time register 2 (ADC_SMPR2)
### 11.12.6 ADC injected channel data offset register x (ADC_JOFRx) (x=1..4)
### 11.12.7 ADC watchdog higher threshold register (ADC_HTR)
### 11.12.8 ADC watchdog lower threshold register (ADC_LTR)
### 11.12.9 ADC regular sequence register 1 (ADC_SQR1)
* Bits 31:24 Reserved, must be kept at reset value.
* Bits 23:20 L[3:0]: Regular channel sequence length
  * These bits are written by software to define the total number of conversions in the regular channel conversion sequence.
    * 0000: 1 conversion
    * 0001: 2 conversions
    * 1111: 16 conversions
* Bits 19:15 SQ16[4:0]: 16th conversion in regular sequence
  * These bits are written by software with the channel number (0..18) assigned as the 16th in the conversion sequence.
    * Bits 14:10 SQ15[4:0]: 15th conversion in regular sequence
    * Bits 9:5 SQ14[4:0]: 14th conversion in regular sequence
    * Bits 4:0 SQ13[4:0]: 13th conversion in regular sequence

### 11.12.10 ADC regular sequence register 2 (ADC_SQR2)
* Bits 31:30 Reserved, must be kept at reset value.
* Bits 29:26 SQ12[4:0]: 12th conversion in regular sequence
  * These bits are written by software with the channel number (0..18) assigned as the 12th in the sequence to be converted.
* Bits 24:20 SQ11[4:0]: 11th conversion in regular sequence
* Bits 19:15 SQ10[4:0]: 10th conversion in regular sequence
* Bits 14:10 SQ9[4:0]: 9th conversion in regular sequence
* Bits 9:5 SQ8[4:0]: 8th conversion in regular sequence
* Bits 4:0 SQ7[4:0]: 7th conversion in regular sequence

### 11.12.11 ADC regular sequence register 3 (ADC_SQR3)
* Bits 31:30 Reserved, must be kept at reset value.
* Bits 29:25 SQ6[4:0]: 6th conversion in regular sequence
  * These bits are written by software with the channel number (0..18) assigned as the 6th in thesequence to be converted.
* Bits 24:20 SQ5[4:0]: 5th conversion in regular sequence
* Bits 19:15 SQ4[4:0]: 4th conversion in regular sequence
* Bits 14:10 SQ3[4:0]: 3rd conversion in regular sequence
* Bits 9:5 SQ2[4:0]: 2nd conversion in regular sequence
* Bits 4:0 SQ1[4:0]: 1st conversion in regular sequence

### 11.12.12 ADC injected sequence register (ADC_JSQR)
* Bits 31:22 Reserved, must be kept at reset value.
* Bits 21:20 JL[1:0]: Injected sequence length
  * These bits are written by software to define the total number of conversions in the injectedchannel conversion sequence.
    * 00: 1 conversion
    * 01: 2 conversions
    * 10: 3 conversions
    * 11: 4 conversions
* Bits 19:15 JSQ4[4:0]: 4th conversion in injected sequence (when JL[1:0]=3, see note below)
  * These bits are written by software with the channel number (0..18) assigned as the 4th in thesequence to be converted.
* Bits 14:10 JSQ3[4:0]: 3rd conversion in injected sequence (when JL[1:0]=3, see note below)
* Bits 9:5 JSQ2[4:0]: 2nd conversion in injected sequence (when JL[1:0]=3, see note below)
* Bits 4:0 JSQ1[4:0]: 1st conversion in injected sequence (when JL[1:0]=3, see note below)
* Note:
  * When JL[1:0]=3 (4 injected conversions in the sequencer), the ADC converts the channels in the following order:
    * JSQ1[4:0], JSQ2[4:0], JSQ3[4:0], and JSQ4[4:0].
  * When JL=2 (3 injected conversions in the sequencer), the ADC converts the channels in the following order:
    * JSQ2[4:0], JSQ3[4:0], and JSQ4[4:0].
  * When JL=1 (2 injected conversions in the sequencer), the ADC converts the channels in starting from 
    * JSQ3[4:0], and then JSQ4[4:0].
  * When JL=0 (1 injected conversion in the sequencer), the ADC converts 
    * only JSQ4[4:0] channel.

### 11.12.13 ADC injected data register x (ADC_JDRx) (x= 1..4)
* Bits 15:0 JDATA[15:0]: Injected data
  * These bits are read-only. They contain the conversion result from injected channel x. The data are left -or right-aligned as shown in Figure 35 and Figure 36.

### 11.12.14 ADC regular data register (ADC_DR)
* Bits 15:0 DATA[15:0]: Regular data
  * These bits are read-only. They contain the conversion result from the regular channels.
  * The data are left- or right-aligned as shown in Figure 35 and Figure 36.

### 11.12.15 ADC common control register (ADC_CCR)
* Bits 31:24 Reserved, must be kept at reset value.
* Bit 23 TSVREFE: Temperature sensor and V REFINT enable
  * This bit is set and cleared by software to enable/disable the temperature sensor and the V REFINT channel.
    * 0: Temperature sensor and V REFINT channel disabled
    * 1: Temperature sensor and V REFINT channel enabled
  * Note: VBATE must be disabled when TSVREFE is set. If both bits are set, only the VBAT conversion is performed.
* Bit 22 VBATE: V BAT enable
  * This bit is set and cleared by software to enable/disable the V BAT channel.
    * 0: V BAT channel disabled
    * 1: V BAT channel enabled
* Bits 21:18 Reserved, must be kept at reset value.
* Bits 17:16 ADCPRE: ADC prescaler
  * Set and cleared by software to select the frequency of the clock to the ADC. .
  * Note:
    * 00: PCLK2 divided by 2
    * 01: PCLK2 divided by 4
    * 10: PCLK2 divided by 6
    * 11: PCLK2 divided by 8
* Bits 15:0 Reserved, must be kept at reset value.

