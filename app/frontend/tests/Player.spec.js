import Player from '../packs/components/Player.vue'
import { mount } from '@vue/test-utils'

describe('Player', () => {
  let playerProp

  beforeEach(() => {
    playerProp = {
      props: {
        player: {
          position: null,
          name: null,
          score: null,
          colour: null
        }
      }
    }
  })

  test('if the player position is defined', () => {
    playerProp.props.player.position = '1'
    const wrapper = mount(Player, playerProp)

    expect(wrapper.find('[data-testid="playerPosition"]').exists()).toBe(true)
  })

  test('if the player position isn\'t defined', () => {
    const wrapper = mount(Player, playerProp)

    expect(wrapper.find('[data-testid="playerPosition"]').exists()).toBe(false)
  })

  test('the players name is displayed', () => {
    playerProp.props.player.name = 'John'
    const wrapper = mount(Player, playerProp)

    expect(wrapper.find('[data-testid="playerName"]').text()).toBe('John')
  })

  test('if the players score is defined', () => {
    playerProp.props.player.score = '10'
    const wrapper = mount(Player, playerProp)

    expect(wrapper.find('[data-testid="playerScore"]').text()).toBe('10')
  })

  test('if the players score isn\'t defined', () => {
    const wrapper = mount(Player, playerProp)

    expect(wrapper.find('[data-testid="playerScore"]').exists()).toBe(false)
  })

  test('the players chosen colour should change the background colour', () => {
    playerProp.props.player.colour = 'red'
    playerProp.props.player.name = 'John'
    playerProp.props.player.position = '1'
    const wrapper = mount(Player, playerProp)

    const playerPosition = wrapper.find('[data-testid="playerPosition"]').element
    const playerName = wrapper.find('[data-testid="playerName"]').element

    expect(playerPosition.style.backgroundColor).toBe('red')
    expect(playerName.style.backgroundColor).toBe('red')
  })
});
