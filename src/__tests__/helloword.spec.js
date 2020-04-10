import { shallowMount } from '@vue/test-utils'
import HelloWord from '../components/HelloWorld.vue'

describe('HelloWord.vue', () => {
  test('Register is a component', () => {
	const wrapper = shallowMount(HelloWord)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
})
