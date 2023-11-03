# 1. os.js
[OS.js](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/os-js/OS.js)：JavaScript 写的基于浏览器上的桌面操作系统。[在线演示](https://demo.os-js.org/)，使用展示如图
![[imgs/Pasted image 20231102145310.png]]

# 2. nodeppt
[nodeppt](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/ksky521/nodeppt)：这可能是迄今为止最好的网页版演示库，[在线演示](http://qdemo.sinaapp.com/)


# 3. mvvm
[mvvm](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/DMQ/mvvm)：剖析 vue 实现原理，了解 vue 的双向数据绑定原理以及核心代码模块，自己动手实现简易版 mvvm

# 4. vue-3d-model
[vue-3d-model](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/hujiulong/vue-3d-model)：展示三维模型的 Vue 组件，支持模型操作和模型点击事件，能自动缩放模型到合适大小并校正偏移，目前支持 obj、stl、dae 和 json 格式的模型，示例代码：
```html
<template>
    <model-obj src="example/models/obj/LeePerrySmith.obj"></model-obj>
</template>
<script>
    import { ModelObj } from 'vue-3d-model'

    export default {
        components: { ModelObj }
    }
</script>
```

# 5. IDValidator
[IDValidator](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/mc-zone/IDValidator)：中国大陆个人身份证号验证，支持 15、18 位身份证号，API 如下：

- `isValid` 验证号码是否合法，合法返回 True，不合法返回 False
- `getInfo` 号码合法时返回分析信息（地区、出生日期、性别、校验位），不合法返回 False
- `makeID` 伪造一个符合校验的 ID