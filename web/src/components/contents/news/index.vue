<template>
  <div class="news" v-loading.body="loading">
    <el-card shadow="hover" v-for="item in resultData" class="news-card" @click="openDrawer(item)">
      <div class="news-card-title">{{ item.title }}</div>
      <div class="news-card-main">
        <div class="news-card-img">
          <img :src="item.imgUrl">
          <div>{{ item.date }}</div>
        </div>
        <div class="news-card-text">
          <div>{{ item.description }}</div>
        </div>
      </div>
    </el-card>
    <el-drawer v-model="drawer" :title=newTitle size="50%" style="width: 100%;" @close="closeDrawer()">
      <el-scrollbar ref="topRef">
        <div v-html="detailData" style="width: 100%;"></div>
      </el-scrollbar>
    </el-drawer>
  </div>
</template>

<script setup lang='ts'>
import { ref, Ref } from 'vue'
import { getNews } from '../../../server'
import type { resultNewsType } from '../../../types/news'
import { ElMessage, ElScrollbar } from 'element-plus'

const loading: Ref<boolean> = ref(false)
const resultData: Ref<resultNewsType[]> = ref([])
const detailData: Ref<string> = ref('')
const drawer: Ref<boolean> = ref(false);
const newTitle: Ref<string> = ref('')
const topRef: Ref<typeof ElScrollbar | undefined> = ref();
// const tempData = [
//     {
//         "title": "荣退回眸别有声，韶华不负杏坛情——计算机学院软件工程系退休教师欢送会",
//         "description": "1月11日，在教学楼A座306A教室，举行了一场特殊的仪式——计算机学院软件工程系退休教师欢送会。欢送会采用了茶话会的形式，计算机学院领导、全体软件工程系教师参加。 退休教师徐婉珍老师，2002年5月开始在广东东软学院任教，担任计算机学院软件工程系教师，至今已在教师岗位上辛勤耕耘了二十余年。徐老师对学生生活上爱护关怀、和蔼可亲，学业要求严格、授课生动，深受学生的欢迎。无论是治学严谨、精益求精的教学态度，抑或...",
//         "date": "发布时间：2024-01-13 17:05:04",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2024/01/16/6139f1021aa747b5803781f66a574c0d_320_200.png",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17322"
//     },
//     {
//         "title": "数媒学院举行校际交流生结业仪式",
//         "description": "时光飞逝，转眼间，赴广东东软学院数字媒体与设计学院的四位交流生为期一学期的学习交流活动接近尾声。1月4日上午，在C315举行了一场特别的结业仪式，仪式由数字媒体与设计学院素质教师陈陈主持。素质教师陈陈对四位交流生来校交流的表现进行点评。他提到，四位交流生在校期间表现优异，重视课程学习，积极参与各项文体活动，交流以来从未请假缺席任何活动。四位交流生就在广东东软学院的学习交流分享心得体会。她们表示，感谢...",
//         "date": "发布时间：2024-01-08 09:36:22",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2024/01/08/fa76a44c3f334beea887d1ccb3b32c79_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17208"
//     },
//     {
//         "title": "我校召开第五届教职工代表大会暨工会会员代表大会第一次会议",
//         "description": "12月27日，广东东软学院第五届教职工代表大会暨工会会员代表大会第一次会议在我校F218报告厅胜利召开。校领导孙伟、伍少德、朱爱红、程学良、白露、石明罡出席会议，学校各学院、各部门教职工代表共114人参加会议。大会由第四届工会副主席陈泽楷主持。大会在雄壮的国歌声中开幕。本次大会的主题是：以习近平新时代中国特色社会主义思想和党的二十大精神为指导，深入学习习近平总书记关于工人阶级、工会工作和教育工作的重要论述...",
//         "date": "发布时间：2023-12-28 11:10:38",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/28/726dc6ea45a14981b00172b7a0f4e221_320_200.jpg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17094"
//     },
//     {
//         "title": "我校举行2023年素质教师素质能力大赛",
//         "description": "12月26日下午，我校2023年素质教师素质能力大赛决赛在多功能报告厅BG06举行。校长助理石明罡、第八届广东省高校素质教师素质能力大赛一等奖获得者暨南大学牛若曦、学生工作部部长陈润坚、校团委书记曾露薇和各二级学院党总支书记出席并担任决赛评委。大赛由学生工作部曹金玲老师主持。本次大赛分为初赛与决赛。初赛为基础知识测试，各二级学院推荐的选手参赛，旨在全方位考察素质教师的理论知识；决赛为实践技能比赛，旨在全方...",
//         "date": "发布时间：2023-12-28 10:25:08",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/28/31b6430ec4714978b51970269cb456de_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17093"
//     },
//     {
//         "title": "我校应邀访问韩国海洋大学",
//         "description": "应韩国海洋大学邀请，国际教育学院院长徐斌教授于12月19日至22日前往韩国海洋大学进行了访问。访问期间，徐斌教授分别与韩国海洋大学教务处处长兼执行校长Choi Suk Yoon教授、人文学院院长Kim InYu教授、国际合作与交流处处长Kim Sang Gi举行了会谈。会谈中，双方就师生互换、学术交流等进行了深入的探讨，并达成了积极的共识。为进一步加强合作，韩国海洋大学人文学院还举行了合作意向书的签署仪式。仪式结束之后，徐斌教授还...",
//         "date": "发布时间：2023-12-25 15:30:07",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/25/679624825efe44319a2b02df412430c5_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17049"
//     },
//     {
//         "title": "我校健康医疗科技学院到佛山市颐养院、畅享荟养老公寓开展调研",
//         "description": "12月20日，我校健康医疗科技学院院到佛山市颐养院和畅享荟养老公寓进行行业调研，就校企合作、产教融合、就业对接、科研项目等事宜与两家康养中心展开深入交流。 佛山医养康养协会秘书长谢峥结合目前养老事业发展现状，详细解说了“佛医养”康养服务平台使用情况；畅享荟养老公寓提出建议，希望我校在培养人才方面能放眼大湾区的大健康产业，积极参与养老服务与管理行业，以此提升学生在就业市场里的竞争力。后续各方围绕学生...",
//         "date": "发布时间：2023-12-22 13:08:11",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/22/60c55707d83c49d082274017df7394a7_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17034"
//     },
//     {
//         "title": "我校健康医疗科技学院到深圳医养企事业单位开展调研",
//         "description": "为积极探索教育模式改革，加快高质量的健康服务与管理技能人才的培养，12月19日，我校健康医疗科技学院到深圳作为科技有限公司开展调研，双方就智能康复实训室建设、产学研结合、人才培养模式等方面进行深入探讨和交流。调研队伍参观了作为科技研发中心和智能护理演示厅，体验了包括大小便智能护理、洗浴智能护理、上下床智能转移、智能助行、外骨骼智能康复、智慧照护等六大应用场景全系列智能护理和康复产品，深入了解了作为...",
//         "date": "发布时间：2023-12-22 12:38:10",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/22/ba1d3da2339e4eee9db4324af9e06744_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17033"
//     },
//     {
//         "title": "政校行企联动，推动康养事业高质量发展",
//         "description": "12月18日，我校健康医疗科技学院到佛山市三水区民政局下属医养机构——九如城三水康养中心，以及三水区社会福利中心开展行业调研。本次调研得到三水区民政局大力支持，由三水区民政局社会福利事务股股长孔令薇带队参观交流。调研队伍首先来到九如城三水康养中心进行参观交流。九如城集团是医、康、养、教、研、旅相融合的康养服务综合运营商，位于佛山市三水区森林公园内，是一家以生态养老、文化养老、医养结合为理念的中高端...",
//         "date": "发布时间：2023-12-22 11:54:33",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/22/97eadaff7bdb4a2fab6be46fb1aab34b_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17032"
//     },
//     {
//         "title": "+1+3+5，我校省级一流本科课程再增9门！",
//         "description": "近日，广东省教育厅发布《关于公布2023年度省级一流本科课程认定结果的通知》，经专家评审、公示、复审等环节，我校推荐的9门课程获认定为省级一流本科课程，包括线上一流本科课程1门、线下一流本科课程3门、线上线下混合式一流本科课程5门。至此，我校已建有国家级一流本科课程1门、省级一流本科课程23门。2023年获认定省级一流本科课程名单课程建设是学科专业和人才培养的重要平台，是落实立德树人根本任务的重要举措。长期以...",
//         "date": "发布时间：2023-12-22 10:52:22",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/22/a684291347784fd595a71a3485ed21cc_320_200.jpg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17031"
//     },
//     {
//         "title": "促交流，谋发展——我校代表团赴广州商学院考察学习",
//         "description": "为了推动我校国际化办学的高质量发展，加强与省内民办兄弟院校的交流，在程学良副校长的带领下，我校一行9人于2023年12月19日下午前往广州商学院，参加了一场富有成果的学习交流会。此次出访由广东东软学院副校长程学良带队，成员包括招生就业工作部部长路英杰、外国语学院院长王玉峰、继续教育学院院长麦月强、教务部副部长李正慧和国际教育学院副院长唐诗璐等。本次交流活动受到了广州商学院副校长郭航、招生办主任谢秋燕、教...",
//         "date": "发布时间：2023-12-21 10:00:58",
//         "imgUrl": "https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/799af27f479e4c5da719c1fded934983_320_200.jpeg",
//         "detailUrl": "https://www.nuit.edu.cn/xxzx/xyxw/content_17008"
//     }
// ]
// const tempDetail = `<!-- 标题 -->

// <div class="property">
//     <span>发布时间：2023-12-21 10:00:58</span>


// </div>
// <!-- 正文 -->
// <div class="conTxt" data-power-accessible-reading="" data-power-defaultfontsize="16" data-power-defaultlineheight="2"
//     data-power-imgmaxwidth="800">
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">为了推动我校国际化办学的高质量发展，加强与省内民办兄弟院校的交流，在程学良副校长的带领下，我校一行9人于2023年12月19日下午前往广州商学院，参加了一场富有成果的学习交流会。此次出访由广东东软学院副校长程学良带队，成员包括招生就业工作部部长路英杰、外国语学院院长王玉峰、继续教育学院院长麦月强、教务部副部长李正慧和国际教育学院副院长唐诗璐等。</span>
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">本次交流活动受到了广州商学院副校长郭航、招生办主任谢秋燕、教务处副处长李迪宏、国际教育学院副院长杨粤青、洪振华一行的热情款待，交流成果丰硕。双方就各自学校的发展情况、国际化办学经验、教育教学改革等方面进行了深入的探讨和交流，共同分享了宝贵的经验和启示。</span>
//     </p>
//     <p style="text-align: center"><img src="https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/799af27f479e4c5da719c1fded934983.jpeg" alt="799af27f479e4c5da719c1fded934983.jpeg" width="640" height="440" border="0" vspace="0" title="799af27f479e4c5da719c1fded934983.jpeg" style="width: 640px; height: 440px">
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">会上，郭航副校长亲切地向我校代表团介绍了广州商学院的区位优势、发展历程、及国际化办学的成果和经验。与此同时，谢秋燕主任也分享了广州商学院国际教育学院在项目招生方面的成功经验，为我校代表团提供了宝贵的参考。</span>
//     </p>
//     <p style="text-align: center"><img src="https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/e1139fe3e06940a98d29b6376e5ba392.jpeg" alt="e1139fe3e06940a98d29b6376e5ba392.jpeg" width="640" height="440" border="0" vspace="0" title="e1139fe3e06940a98d29b6376e5ba392.jpeg" style="width: 640px; height: 440px">
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">随后，我校程学良副校长以生动的语言详细介绍了我校的办学历史、专业设置、极具特色的培养体系以及国际教育的丰硕成果。</span>
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">他首先提到了我校基于集团化办学的优势，这种办学模式为我校学生提供了丰富的教育资源和广泛的合作机会。同时，程学良副校长还介绍了我校TOPCARES一体化应用型人才培养模式的特色，这种模式注重培养学生的实践能力和创新精神。</span>
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">在探讨和交流的环节，两校就招生工作、学籍管理和留学服务等方面进行了广泛而深入的讨论，双方相互借鉴、互相启发，积累了宝贵的经验和建议。</span>
//     </p>
//     <p style="text-align: center">
//         <img src="https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/01ae117369a44cc585185021be165b54.jpeg" alt="01ae117369a44cc585185021be165b54.jpeg" width="640" height="440" border="0" vspace="0" title="01ae117369a44cc585185021be165b54.jpeg" style="width: 640px; height: 440px"><img src="https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/42cfc1357f964991825b09b8d850840a.jpeg" alt="42cfc1357f964991825b09b8d850840a.jpeg" width="640" height="440" border="0" vspace="0" title="42cfc1357f964991825b09b8d850840a.jpeg" style="text-indent: 2em; text-align: left; width: 640px; height: 440px">
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px"> &nbsp;会议圆满结束后，双方校领导互赠精心准备的礼品，表达了友好交流的美好祝愿。</span>
//     </p>
//     <p style="text-align: center"><img src="https://www.nuit.edu.cn/upload/main/contentmanage/article/image/2023/12/21/9c17de8771684ad8a04765ad32e6b27c.jpeg" alt="9c17de8771684ad8a04765ad32e6b27c.jpeg" width="640" height="440" border="0" vspace="0" title="9c17de8771684ad8a04765ad32e6b27c.jpeg" style="width: 640px; height: 440px">
//     </p>
//     <p dir="ltr" style="line-height: 3em; text-indent: 2em">
//         <span style="font-family: 思源黑体, &quot;Source Han Sans CN&quot;; font-size: 16px">紧密交流，共创未来。我校将继续加强与省内兄弟院校的联系，通过交流学习，思想碰撞，总结经验，为成为区域内有特色、高水平的应用IT应用技术大学而努力。</span>
//     </p>
// </div>`

const getFormData = async () => {
  try {
    const newsData: resultNewsType[] = await getNews({ url: 'https://www.nuit.edu.cn/xxzx/xyxw_1', detail: 'false' })
    const newsData1: resultNewsType[] = await getNews({ url: 'https://www.nuit.edu.cn/xxzx/xyxw_2', detail: 'false' })
    newsData.push(...newsData1)
    // const newsData: resultNewsType[] = tempData
    if (newsData.length != 0) {
      resultData.value = newsData
    } else {
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}
getFormData()

const openDrawer = async (item: resultNewsType) => {
  try {
    loading.value = true
    const newsData: string = await getNews({ url: item.detailUrl, detail: 'true' })
    // const newsData: string = tempDetail
    if (newsData != '') {
      loading.value = false
      drawer.value = true;
      newTitle.value = item.title
      detailData.value = newsData
    } else {
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}

const closeDrawer = () => {
  if (topRef.value) {
    topRef.value.setScrollTop(0);
  }
}
</script>

<style lang="less" scoped>
.news {
  overflow: auto;
  height: var(--element-height-full);
  width: var(--element-width-full);
  display: flex;
  flex-wrap: wrap;

  &::-webkit-scrollbar {
    display: none;
  }

  :deep(.el-drawer__title) {
    font-weight: bold;
    font-size: 19px !important;
  }

  &-card {
    width: calc(50% - 20px);
    box-sizing: border-box;
    margin: 10px;
    border-radius: 10px;

    &-title {
      height: 30px;
      font-size: 19px !important;
      font-weight: bold;
      margin-bottom: 10px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
    }

    &-main {
      display: flex;
      align-items: center;
    }

    &-img {
      box-sizing: border-box;
      padding-right: 20px;

      &>img {
        height: 140px;
      }

      &>div {
        display: flex;
        justify-content: center;
        font-size: 13px !important;
      }
    }

    &-text {
      flex: 1;
    }
  }
}

:deep(.conTxt img) {
  width: var(--element-width-full);
}
</style>