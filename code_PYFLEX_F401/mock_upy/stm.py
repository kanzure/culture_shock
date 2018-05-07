class mem_mock(object):
    def __init__(self):
        self.values = {}

    def __getitem__(self, key):
        # if key is of invalid type or value, the list values will raise the error
        try:
            return self.values[key]
        except:
            return 1

    def __setitem__(self, key, value):
        self.values[key] = value

mem32 = mem_mock()
mem16 = mem_mock()
mem8 = mem_mock()


GPIO_AFR1 = 1
GPIOB = 1
GPIO_MODER = 1
RCC = 1
RCC_AHB1ENR = 1
RCC_APB1ENR = 1
RCC_APB2ENR = 1
TIM1 = 1
TIM2 = 1
TIM3 = 1
TIM4 = 1
TIM5 = 1
TIM_ARR = 1
TIM_CCER = 1
TIM_CCMR1 = 1
TIM_CCMR2 = 1
TIM_CCR1 = 1
TIM_CCR2 = 1
TIM_CNT = 1
TIM_CR1 = 1
TIM_CR2 = 1
TIM_EGR = 1
TIM_PSC = 1
TIM_RCR = 1
TIM_SMCR = 1
ADC1 = 1
ADC_CR2 = 1
GPIO_ODR = 1
TIM_BDTR = 1
TIM_SR = 1
